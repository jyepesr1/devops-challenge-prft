module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.1.0"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  subnets                   = data.terraform_remote_state.environment.outputs.private_subnets
  vpc_id                    = data.terraform_remote_state.environment.outputs.vpc_id
  cluster_enabled_log_types = var.cluster_enabled_log_types
  map_roles                 = var.map_roles
  map_users                 = var.map_users

  cluster_endpoint_private_access                = true
  cluster_endpoint_public_access                 = var.cluster_endpoint_public_access
  cluster_create_endpoint_private_access_sg_rule = true
  cluster_endpoint_private_access_cidrs          = var.cluster_endpoint_private_access_cidrs
  cluster_iam_role_name                          = var.cluster_iam_role_name
  create_fargate_pod_execution_role              = true

  manage_aws_auth              = true
  enable_irsa                  = true
  manage_cluster_iam_resources = true
  write_kubeconfig             = var.write_kubeconfig

  fargate_profiles     = var.fargate_profiles
  node_groups_defaults = var.node_groups_defaults
  node_groups          = var.node_groups

  cluster_encryption_config = [
    {
      provider_key_arn = data.terraform_remote_state.environment.outputs.kms_key_arn
      resources        = ["secrets"]
    }
  ]

  kubeconfig_aws_authenticator_command      = "aws"
  kubeconfig_aws_authenticator_command_args = ["--region", var.region, "eks", "get-token", "--cluster-name", var.cluster_name]

  tags = merge(var.tags, {
    Environment = var.environment
    Terraform   = true
  })
}

