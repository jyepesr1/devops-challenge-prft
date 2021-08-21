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

variable "region" {}

variable "irsa_mapping" {
  default = {}
}

variable "map_roles" {
  type = list(any)
  default = []
}

variable "map_users" {
  type = list(any)
  default = []
}
