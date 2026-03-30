

# 1. Security Group — controls inbound access to RDS

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow inbound PostgreSQL traffic to RDS"
  vpc_id      = var.vpc_id  

  ingress {
    description = "PostgreSQL access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}



# 2. DB Subnet Group — RDS requires subnets in ≥ 2 AZs

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "rds-subnet-group"
  }
}



# 3. RDS Instance

resource "aws_db_instance" "default" {
  
  allocated_storage = var.allocated_storage


  engine         = var.db_engine
  engine_version = var.db_engine_version

  instance_class = var.db_instance_class

 
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password


  parameter_group_name = "default.${var.db_engine}${var.db_engine_pggroup}"

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]


  backup_retention_period = var.db_backup_retention_period
  backup_window           = var.db_backup_window
  maintenance_window      = var.db_maintenance_window

 
  skip_final_snapshot = true

  tags = {
    Name = "terraform-rds-instance"
  }
}
