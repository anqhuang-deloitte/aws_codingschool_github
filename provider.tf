terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket         = "team-f-terraform-state-bucket"
    key            = "terra-backend/terraform.tfstate"
    encrypt        = true
    region         = "eu-west-1"
    dynamodb_table = "team-F-terraform-state-locking"
    access_key     = "AKIAXUIFKUZQWSC2375N"
    secret_key     = "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"
  }
}

# Configure the AWS Credentials
provider "aws" {
  access_key     = "AKIAXUIFKUZQWSC2375N"
  secret_key     = "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"
  region         = "eu-west-1"
}
