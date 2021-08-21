output "pave_etl_assumable_role_name" {
  value = module.iam_assumable_role_pave_etl.this_iam_role_name
}

output "kubernetes_cluster_admin_assumable_role_arn" {
  value = module.iam_assumable_role_kubernetes_cluster_admin.this_iam_role_arn
}

output "kubernetes_cluster_edit_assumable_role_arn" {
  value = module.iam_assumable_role_kubernetes_cluster_edit.this_iam_role_arn
}

output "kubernetes_cluster_view_assumable_role_arn" {
  value = module.iam_assumable_role_kubernetes_cluster_view.this_iam_role_arn
}