resource "aws_efs_file_system" "this" {
  creation_token = "${var.prefix}-${var.environment}"
  tags           = var.tags
  encrypted      = true
}

resource "aws_efs_mount_target" "this" {
  count          = length(var.private_subnets)
  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.private_subnets[count.index]
  security_groups = [
    aws_security_group.efs.id
  ]
}

resource "aws_security_group" "efs" {
  name        = "${var.prefix}-efs-${var.environment}"
  description = "Allow traffic from self"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    self        = true
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}

