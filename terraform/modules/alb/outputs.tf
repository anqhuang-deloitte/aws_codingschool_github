output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.main.arn
}

output "aws_security_group_alb_id" {
  value = aws_security_group.alb.id
}
