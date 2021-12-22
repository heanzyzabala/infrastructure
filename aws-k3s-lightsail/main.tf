terraform {
  # Must use terraform cli 1.1.0
  # cloud {
  #   organization = "heanzyzabala"
  #   workspaces {
  #     name = "infrastructure"
  #   }
  # }

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

module "lightsail_k3s_server" {
  source            = "../terraform-modules/aws-lightsail"
  name              = "k3s_server"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
  user_data = templatefile("install-server.sh", {
    K3S_SERVER_PUBLIC_IP = public_ip
    K3S_SERVER_TOKEN     = "token"
  })
}

module "lightsail_k3s_agent" {
  source            = "../terraform-modules/aws-lightsail"
  name              = "k3s_agent"
  availability_zone = "ap-southeast-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"
  user_data = templatefile("install-agent.sh", {
    K3S_SERVER_IP    = module.lightsail_k3s_server.private_ip
    K3S_SERVER_TOKEN = "token"
  })
  depends_on = [
    module.lightsail_k3s_server
  ]
}
