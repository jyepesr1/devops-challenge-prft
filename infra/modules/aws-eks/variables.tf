variable "cluster_name" {}

variable "cluster_version" {
  type    = string
  default = "1.21"
}

variable "cluster_enabled_log_types" {}

variable "fargate_profiles" {
  default = null
}

variable "environment" {}

variable "tags" {
  default = {}
}

variable "cluster_iam_role_name" {}

variable "cluster_endpoint_public_access" {}

variable "write_kubeconfig" {
  type    = bool
  default = false
}

variable "node_groups" {}

variable "node_groups_defaults" {
  default = {}
}

variable "irsa_mapping" {
  default = {}
}

variable "subnets" {}

variable "vpc_id" {}

variable "map_roles" {
  default = []
}

variable "map_users" {
  default = []
}

variable "cluster_endpoint_private_access" {
  default = true
}

variable "cluster_create_endpoint_private_access_sg_rule" {
  default = false
}

variable "cluster_endpoint_private_access_cidrs" {
  default = []
}

variable "create_fargate_pod_execution_role" {
  default = false
}

variable "manage_aws_auth" {
  default = false
}

variable "enable_irsa" {
  default = true
}

variable "manage_cluster_iam_resources" {
  default = true
}

variable "cluster_encryption_config" {
  default = null
}

variable "kubeconfig_aws_authenticator_command" {
  default = "aws"
}

variable "kubeconfig_aws_authenticator_command_args" {
  default = []
}

variable "region" {}