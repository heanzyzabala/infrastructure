provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "ecrpublic_repository" {
  provider        = aws.us_east_1
  repository_name = var.name

  catalog_data {
    architectures     = ["ARM"]
    operating_systems = ["Linux"]
  }
}
