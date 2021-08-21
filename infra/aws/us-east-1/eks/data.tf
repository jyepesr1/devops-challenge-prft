data "aws_eks_cluster" "cluster" {
  name = module.kubernetes.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.kubernetes.cluster_id
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
