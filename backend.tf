# ============================================================
# backend.tf
# Remote state storage using S3 + DynamoDB state locking.
#
# ⚠️  Complete these one-time AWS setup steps BEFORE
#     running `terraform init`:
#
#  1. Create the S3 state bucket:
#       aws s3 mb s3://my-terraform-state-bucket --region ap-south-1
#
#  2. Enable versioning (allows state rollback):
#       aws s3api put-bucket-versioning \
#         --bucket my-terraform-state-bucket \
#         --versioning-configuration Status=Enabled
#
#  3. Enable server-side encryption:
#       aws s3api put-bucket-encryption \
#         --bucket my-terraform-state-bucket \
#         --server-side-encryption-configuration \
#         '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
#
#  4. Create the DynamoDB lock table:
#       aws dynamodb create-table \
#         --table-name terraform-lock \
#         --attribute-definitions AttributeName=LockID,AttributeType=S \
#         --key-schema AttributeName=LockID,KeyType=HASH \
#         --billing-mode PAY_PER_REQUEST \
#         --region ap-south-1
# ============================================================

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"         # ← replace with your state bucket name
    key            = "projects/rds/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"                    # ← replace with your DynamoDB table name
  }
}
