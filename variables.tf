
variable "region" {
  description = "AWS region where all resources will be deployed"
  type        = string
  default     = "ap-south-1"
}



# Networking

variable "vpc_id" {
  description = "ID of the existing VPC where the RDS instance will be deployed"
  type        = string
  # No default — must be supplied via tfvars
}

variable "subnet_ids" {
  description = "List of subnet IDs (minimum 2, in different AZs) for the DB subnet group"
  type        = list(string)
  # No default — must be supplied via tfvars
}



# RDS Engine

variable "db_engine" {
  description = "Database engine to use (e.g. postgres, mysql, mariadb)"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "15.7"
}

variable "db_engine_pggroup" {
  description = "Major version used to build the parameter group name (e.g. '15' for postgres15)"
  type        = string
  default     = "15"
}



# RDS Instance

variable "db_instance_class" {
  description = "RDS instance class (e.g. db.t3.micro, db.t3.medium)"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
  default     = 20
}


# Database Credentials
variable "db_name" {
  description = "Name of the initial database to create inside the RDS instance"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
  default     = "reyaz"
}

variable "db_password" {
  description = "Master password for the RDS instance — provide via tfvars or env var, never hardcode"
  type        = string
  sensitive   = true  # Marks the value as sensitive; Terraform will redact it in CLI output
}



# Backup & Maintenance

variable "db_backup_retention_period" {
  description = "Number of days to retain automated backups (0 disables backups)"
  type        = number
  default     = 7
}

variable "db_backup_window" {
  description = "Daily UTC time window for automated backups (format: hh:mm-hh:mm)"
  type        = string
  default     = "03:00-04:00"
}

variable "db_maintenance_window" {
  description = "Weekly UTC time window for system maintenance (format: ddd:hh:mm-ddd:hh:mm)"
  type        = string
  default     = "sun:05:00-sun:06:00"
}
