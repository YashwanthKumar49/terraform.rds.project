
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"         # ← replace with your state bucket name
    key            = "projects/rds/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"                    # ← replace with your DynamoDB table name
  }
}
