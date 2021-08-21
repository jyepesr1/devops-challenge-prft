module "iam_assumable_role_opsline_admin_role" {
  # TODO: to remove after SafeOps project completes
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "~> 3.0"
  role_name           = "OpsLineAdminRole"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = true                               # arn:aws:iam::aws:policy/AdministratorAccess
  trusted_role_arns   = ["arn:aws:iam::350473869200:root"] # OpsLine AWS account
  tags                = var.tags
}

module "pave_admin_role" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "4.2.0"
  role_name           = "PaveAdmin"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = true
  trusted_role_arns = [
    aws_iam_user.lennon.arn,
    aws_iam_user.sai.arn,
    aws_iam_user.yacine.arn,
    module.iam_assumable_role_opsline_admin_role.this_iam_role_arn
  ]
}

module "pave_production_role" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "4.2.0"
  role_name           = "PaveProduction"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonRDSFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::361452620376:policy/EKSFullAccess"
  ]
  trusted_role_arns = [
    aws_iam_user.lennon.arn,
    aws_iam_user.sai.arn,
    aws_iam_user.yacine.arn
  ]
}

module "pave_engineer_role" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "4.2.0"
  role_name           = "PaveEngineer"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/job-function/SupportUser",
    aws_iam_policy.rds_dev_policy.arn,
    aws_iam_policy.s3_dev_policy.arn,
    aws_iam_policy.eks_user.arn,
    aws_iam_policy.enforce_mfa_policy.arn,
  ]
  trusted_role_arns = [
    aws_iam_user.lennon.arn,
    aws_iam_user.sai.arn,
    aws_iam_user.yacine.arn,
    aws_iam_user.berkay.arn,
  ]
}

module "pave_datascientist_role" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "4.2.0"
  role_name           = "PaveDataScientist"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = false
  custom_role_policy_arns = [
    aws_iam_policy.enforce_mfa_policy.arn,
    "arn:aws:iam::aws:policy/AmazonAthenaFullAccess",
    "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess",
    aws_iam_policy.s3_dev_readonly.arn,
    aws_iam_policy.pave_athena_s3_access.arn
  ]
  trusted_role_arns = [
    aws_iam_user.alain.arn,
    aws_iam_user.ema.arn,
    aws_iam_user.raymond.arn,
    aws_iam_user.sai.arn,
    aws_iam_user.yacine.arn
  ]
}

module "pave_bizops_role" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "4.2.0"
  role_name           = "PaveBizOps"
  create_role         = true
  role_requires_mfa   = true
  attach_admin_policy = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/job-function/Billing",
    "arn:aws:iam::aws:policy/AWSBudgetsActionsWithAWSResourceControlAccess",
    "arn:aws:iam::aws:policy/job-function/SupportUser"
  ]
  trusted_role_arns = [
    aws_iam_user.jack.arn,
    aws_iam_user.raymond.arn
  ]
}

# EKS
# TODO: revisit EKS assumable roles granularity and permissions

module "iam_assumable_role_kubernetes_cluster_admin" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "~> 3.0"
  role_name           = "KubernetesClusterAdmin"
  create_role         = true
  role_requires_mfa   = false
  attach_admin_policy = false
  custom_role_policy_arns = [
    aws_iam_policy.eks_user.arn,
    # Needed for Terraform infrastructure changes on the EKS cluster
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    aws_iam_policy.eks_full_access.arn,
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
  ]
  trusted_role_arns = [
    aws_iam_user.github.arn,
    aws_iam_user.lennon.arn,
    aws_iam_user.yacine.arn,
    aws_iam_user.sai.arn,
    "arn:aws:iam::350473869200:root" # TODO: to remove after SafeOps project completes
  ]
}

module "iam_assumable_role_kubernetes_cluster_edit" {
  source                  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version                 = "~> 3.0"
  role_name               = "KubernetesClusterEdit"
  create_role             = true
  role_requires_mfa       = false
  attach_admin_policy     = false
  custom_role_policy_arns = [aws_iam_policy.eks_user.arn]
  trusted_role_arns = [
    aws_iam_user.lennon.arn,
    aws_iam_user.yacine.arn,
    aws_iam_user.sai.arn
  ]
}

module "iam_assumable_role_kubernetes_cluster_view" {
  source                  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version                 = "~> 3.0"
  role_name               = "KubernetesClusterView"
  create_role             = true
  role_requires_mfa       = false
  attach_admin_policy     = false
  custom_role_policy_arns = [aws_iam_policy.eks_user.arn]
  trusted_role_arns = [
    aws_iam_user.lennon.arn,
    aws_iam_user.yacine.arn,
    aws_iam_user.sai.arn
  ]
}
