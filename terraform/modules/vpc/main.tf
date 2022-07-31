resource "aws_eip" "nat" {
  count = 2
  vpc   = true
}

module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  name                    = "${var.prefix}-${var.environment}"
  cidr                    = var.vpc_cidr
  azs                     = var.azs
  private_subnets         = var.private_subnet_cidrs
  public_subnets          = var.public_subnet_cidrs
  enable_nat_gateway      = true
  single_nat_gateway      = false
  one_nat_gateway_per_az  = false
  tags                    = var.tags
  version                 = "~>2.0"
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true
  external_nat_ip_ids     = aws_eip.nat.*.id
}

resource "aws_security_group" "sg_foo" {
  depends_on = [
    module.vpc.name,
  ]
  name   = "sg vpc"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
