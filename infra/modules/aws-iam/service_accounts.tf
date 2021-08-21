# Service IAM users

resource "aws_iam_user" "github" {
  name = "github"
  path = "/"
}

module "github_actions" {
  # This group will be used exclusively to give permissions to our Github Actions
  # CI/CD service user. It will used for:
  #   - ECR images pushes
  #   - Kubernetes deployments
  #   - Lambda config updates
  #   - Terraform infrastructure creation, modification and deletion
  source                            = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version                           = "4.2.0"
  name                              = "GithubActions"
  group_users                       = [aws_iam_user.github.name]
  attach_iam_self_management_policy = false
  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}


# Service IAM roles

module "iam_assumable_role_pave_etl" {
  source                  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version                 = "~> 3.0"
  role_name               = "PaveETLRole"
  create_role             = true
  role_requires_mfa       = false
  attach_admin_policy     = false
  custom_role_policy_arns = [aws_iam_policy.pave_etl_s3_access.arn]
  trusted_role_services   = ["ec2.amazonaws.com"]
}


module "iam_assumable_role_glue" {
  source              = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version             = "~> 3.0"
  role_name           = "AWSGlueServiceRole"
  create_role         = true
  role_requires_mfa   = false
  attach_admin_policy = false
  custom_role_policy_arns = [
    aws_iam_policy.pave_athena_s3_access.arn,
    "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
  ]
  trusted_role_services = ["glue.amazonaws.com"]
}