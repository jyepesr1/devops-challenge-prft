terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "devops-challenge"

    workspaces {
      prefix = "us-east-1-dev-vpn-"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.52.0"
    }
  }
}
