resource "aws_iam_role" "task_execution_role" {
  name = "${var.prefix}-task-execution-role-${var.environment}"
  tags = var.tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ecs-tasks.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "task_execution_policy" {
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "ssm:GetParameters",
        "kms:Decrypt"
      ],
      "Resource": "*"
    }
  ]
  }
EOF
}

resource "aws_iam_role_policy_attachment" "task_execution_policy_attach" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = aws_iam_policy.task_execution_policy.arn
}


resource "aws_iam_role" "task_role" {
  name = "${var.prefix}-task-role-${var.environment}"
  tags = var.tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ecs-tasks.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "task_policy" {
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:ClientMount",
        "elasticfilesystem:ClientWrite"
      ],
      "Resource": "*"
    }
  ]
  }
EOF
}

resource "aws_iam_role_policy_attachment" "task_policy_attach" {
  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_policy.arn
}


resource "aws_ecs_cluster" "this" {
  name = "${var.prefix}-${var.environment}"
}

resource "aws_security_group" "wordpress" {
  name        = "${var.prefix}-wordpress-${var.environment}"
  description = "Fargate wordpress"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.tags
}

resource "aws_ecs_service" "this" {
  name             = "${var.prefix}-${var.environment}"
  cluster          = aws_ecs_cluster.this.id
  task_definition  = aws_ecs_task_definition.this.arn
  desired_count    = var.desired_count
  launch_type      = "FARGATE"
  platform_version = "1.4.0"
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  network_configuration {
    security_groups = [var.sg_foo, var.aws_security_group_db_id, var.aws_security_group_efs_id, 
                        var.aws_security_group_alb_id, aws_security_group.wordpress.id]
    subnets         = var.private_subnets
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.aws_alb_target_group_arn
    container_name   = "wordpress"
    container_port   = 80
  }

}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.prefix}-${var.environment}"
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  container_definitions    = <<CONTAINER_DEFINITION
[
  {
    "secrets": [
      {
        "name": "WORDPRESS_DB_USER", 
        "valueFROM": "${var.aws_ssm_parameter_db_master_user.arn}"
      },
      {
        "name": "WORDPRESS_DB_PASSWORD", 
        "valueFROM": "${var.aws_ssm_parameter_db_master_password.arn}"
      }
    ],
    "environment": [
      {
        "name": "WORDPRESS_DB_HOST",
        "value": "${var.aws_rds_cluster_endpoint}"
      },
      {
        "name": "WORDPRESS_DB_NAME",
        "value": "wordpress"
      }
    ],
    "essential": true,
    "image": "wordpress",        
    "name": "wordpress",
    "portMappings": [
      {
        "containerPort": 80,
        "protocol": "tcp",
        "hostPort": 80
      }
    ],
    "mountPoints": [
      {
        "containerPath": "/var/www/html",
        "sourceVolume": "efs"
      }
    ]
  }
]
CONTAINER_DEFINITION

  volume {
    name = "efs"
    efs_volume_configuration {
      file_system_id = var.aws_efs_file_system_id
    }
  }
}
