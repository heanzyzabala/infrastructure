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

resource "aws_lightsail_instance" "apps_server" {
  name              = "apps_server"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
}

resource "aws_lightsail_static_ip" "apps_server_static_ip" {
  name = "static_ip"
}

resource "aws_lightsail_static_ip_attachment" "apps_server_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.static_ip.id
  instance_name = aws_lightsail_instance.apps_server.id
}