# ============================================================
# terraform.tfvars
# Environment-specific values for all declared variables.
# ⚠️  This file contains a plaintext password — do NOT commit
#     it to version control. Add it to your .gitignore.
#     For production, use AWS Secrets Manager or Vault instead.
# ============================================================

# AWS Region
region = "ap-south-1"

# Networking
vpc_id     = "vpc-9a8faff2"                             # Replace with your VPC ID
subnet_ids = ["subnet-a6c089ce", "subnet-dd942a91"]    # Replace with your subnet IDs

# RDS Engine
db_engine         = "postgres"
db_engine_version = "15.7"
db_engine_pggroup = "15"

# RDS Instance
db_instance_class = "db.t3.micro"
allocated_storage = 20

# Database Credentials — ⚠️ rotate before going to production
db_name     = "mydatabase"
db_username = "reyaz"
db_password = "Root123456"  # ⚠️ use AWS Secrets Manager in prod

# Backup & Maintenance
db_backup_retention_period = 7
db_backup_window           = "03:00-04:00"
db_maintenance_window      = "sun:05:00-sun:06:00"
