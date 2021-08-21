resource "aws_iam_policy" "service_account_policy" {
  for_each = {
    for service, policy in var.irsa_mapping :
    service => policy if length(policy) > 0
  }

  name   = "${var.environment}-${each.key}-sa-policy"
  policy = jsonencode(each.value)
}

module "service_role" {
  source   = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version  = "3.6.0"
  for_each = var.irsa_mapping

  create_role                   = true
  role_name                     = "${var.environment}-${each.key}-role-${var.region}"
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  oidc_fully_qualified_subjects = ["system:serviceaccount:${each.key}:default"]

  role_policy_arns = concat(
    ["arn:aws:iam::aws:policy/CloudWatchFullAccess"],
    lookup(aws_iam_policy.service_account_policy, each.key, null) != null ? [aws_iam_policy.service_account_policy[each.key].arn] : [],
  )

  tags = var.tags
}