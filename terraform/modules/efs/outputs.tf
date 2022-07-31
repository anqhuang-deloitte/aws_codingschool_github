output "aws_security_group_efs_id" {
  value = aws_security_group.efs.id
}

output "aws_efs_file_system_id" {
  value = aws_efs_file_system.this.id
}