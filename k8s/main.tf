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

module "lightsail_apps_server" {
  source            = "../terraform-modules/aws-lightsail"
  name              = "apps_server"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
}

module "lightsail_ops_server" {
  source            = "../terraform-modules/aws-lightsail"
  name              = "ops_server"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
}
