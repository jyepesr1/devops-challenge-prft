data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "terraform_remote_state" "environment" {
  backend = "remote"

  config = {
    organization = "devops-challenge"
    workspaces = {
      name = "environment"
    }
  }
}

data "aws_caller_identity" "current" {}