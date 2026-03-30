# ============================================================
# provider.tf
# Terraform core version constraint, required providers,
# and AWS provider configuration.
# The provider block was previously mixed into main.tf —
# it belongs here exclusively.
# ============================================================

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
