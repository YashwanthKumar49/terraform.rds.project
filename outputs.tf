

output "rds_instance_id" {
  description = "The unique identifier of the RDS instance"
  value       = aws_db_instance.default.id
}

output "rds_endpoint" {
  description = "Connection endpoint (host:port) for the RDS instance — use this in your app config"
  value       = aws_db_instance.default.endpoint
}

output "rds_port" {
  description = "Port the RDS instance is listening on"
  value       = aws_db_instance.default.port
}

output "rds_db_name" {
  description = "Name of the database created inside the RDS instance"
  value       = aws_db_instance.default.db_name
}

output "rds_username" {
  description = "Master username for the RDS instance"
  value       = aws_db_instance.default.username
}

output "rds_security_group_id" {
  description = "ID of the security group attached to the RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "rds_subnet_group_name" {
  description = "Name of the DB subnet group used by the RDS instance"
  value       = aws_db_subnet_group.rds_subnet_group.name
}
