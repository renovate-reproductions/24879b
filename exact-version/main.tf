terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20"
    }
  }

  backend "local" {}
}

provider "aws" {
  region = "us-east-1"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.3"

  bucket = "renovate-155880"
  acl    = "private"

  versioning = {
    enabled = true
  }
}
