module "pave_employees" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"
  version = "4.2.0"
  name    = "PaveEmployees"
  group_users = [
    aws_iam_user.alain.name,
    aws_iam_user.berkay.name,
    aws_iam_user.ema.name,
    aws_iam_user.jack.name,
    aws_iam_user.lennon.name,
    aws_iam_user.raymond.name,
    aws_iam_user.sai.name,
    aws_iam_user.yacine.name,
  ]
  attach_iam_self_management_policy = true
  custom_group_policy_arns          = [aws_iam_policy.enforce_mfa_policy.arn]
}
