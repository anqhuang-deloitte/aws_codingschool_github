output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_foo" {
  value = aws_security_group.sg_foo.id
}

output "azs" {
  value = module.vpc.azs
}