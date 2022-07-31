output "aws_ssm_parameter_db_master_user" {
  value = aws_ssm_parameter.db_master_user
}

output "aws_ssm_parameter_db_master_password" {
  value = aws_ssm_parameter.db_master_password
}

output "aws_rds_cluster_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "aws_security_group_db_id" {
  value = aws_security_group.db.id
}