terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "devops-challenge"

    workspaces {
      name = "rds"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.52.0"
    }
  }
}

