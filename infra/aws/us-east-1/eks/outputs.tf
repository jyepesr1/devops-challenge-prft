output "cluster_arn" {
  value = module.kubernetes.cluster_arn
}

output "cluster_endpoint" {
  value = module.kubernetes.cluster_endpoint
}

output "cluster_iam_role_arn" {
  value = module.kubernetes.cluster_iam_role_arn
}

output "cluster_version" {
  value = module.kubernetes.cluster_version
}

output "config_map_aws_auth" {
  value = module.kubernetes.config_map_aws_auth
}

output "fargate_iam_role_arn" {
  value = module.kubernetes.fargate_iam_role_arn
}

output "node_groups" {
  value = module.kubernetes.node_groups
}

output "oidc_provider_arn" {
  value = module.kubernetes.oidc_provider_arn
}

output "cluster_oidc_issuer_url" {
  value = module.kubernetes.cluster_oidc_issuer_url
}