data "terraform_remote_state" "environment" {
  backend = "remote"

  config = {
    organization = "devops-challenge"
    workspaces = {
      name = "${var.region}-environment-${var.source_vpc}"
    }
  }
}