output "cluster_arn" {
  value = module.eks.cluster_arn
}

output "cluster_id" {
  value = module.eks.cluster_id
}


output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_iam_role_arn" {
  value = module.eks.cluster_iam_role_arn
}

output "cluster_version" {
  value = module.eks.cluster_version
}

output "config_map_aws_auth" {
  value = module.eks.config_map_aws_auth
}

output "fargate_iam_role_arn" {
  value = module.eks.fargate_iam_role_arn
}

output "node_groups" {
  value = module.eks.node_groups
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}