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

resource "aws_lightsail_instance" "apps-server" {
  name              = "apps-server"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
}