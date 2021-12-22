terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ecr_infrastructure-example-app" {
  source = "../terraform-modules/aws-ecr-repository"
  name   = "infrastructure-example-app"
}
