terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 6.43.0"
    }
  }

  required_version = ">= 1.15.1"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = var.default_tags
  }
}