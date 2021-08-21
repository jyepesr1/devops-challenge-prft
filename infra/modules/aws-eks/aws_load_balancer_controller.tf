resource "aws_iam_policy" "aws_load_balancer_controller" {
  name        = "aws-load-balancer-controller"
  description = "Allows EKS Cluster AWS Load Balancer Controller to provision ALBs."
  policy      = file("${path.module}/policies/aws_load_balancer_controller.json")
  tags        = var.tags
}

locals {
  k8s_service_account_namespace = "kube-system"
  k8s_service_account_name      = "aws-load-balancer-controller"
  load_balancer_iam_role_name   = "eks-load-balancer-controller-role"
}

module "iam_assumable_role_admin" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "3.6.0"

  create_role                   = true
  role_name                     = local.load_balancer_iam_role_name
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = [aws_iam_policy.aws_load_balancer_controller.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${local.k8s_service_account_namespace}:${local.k8s_service_account_name}"]
  tags                          = var.tags
}

resource "kubernetes_service_account" "aws_lb_sa" {
  metadata {
    name      = local.k8s_service_account_name
    namespace = local.k8s_service_account_namespace
    labels = {
      "app.kubernetes.io/component" = "controller"
      "app.kubernetes.io/name"      = "aws-load-balancer-controller"
    }
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.load_balancer_iam_role_name}"
    }
  }
}