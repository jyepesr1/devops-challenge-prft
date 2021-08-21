# MFA policy

resource "aws_iam_policy" "enforce_mfa_policy" {
  path        = "/"
  description = "block users from acccessing anything unless they are mfa auth'd"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "BlockMostAccessUnlessSignedInWithMFA",
        "Effect" : "Deny",
        "NotAction" : [
          "iam:CreateVirtualMFADevice",
          "iam:DeleteVirtualMFADevice",
          "iam:ListVirtualMFADevices",
          "iam:EnableMFADevice",
          "iam:ResyncMFADevice",
          "iam:ListAccountAliases",
          "iam:ListUsers",
          "iam:ListSSHPublicKeys",
          "iam:ListAccessKeys",
          "iam:ListServiceSpecificCredentials",
          "iam:ListMFADevices",
          "iam:GetAccountSummary",
          "sts:GetSessionToken",
          "sts:AssumeRole"
        ],
        "Resource" : "*",
        "Condition" : { "BoolIfExists" : { "aws:MultiFactorAuthPresent" : "false" } }
      },
    ]
  })
}

# ETL policy (legacy)

data "aws_iam_policy_document" "pave_etl_s3_access" {
  statement {
    sid    = "PaveETLS3Access"
    effect = "Allow"
    actions = [
      # Object level
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:AbortMultipartUpload",
      "s3:HeadObject",
      # Bucket level
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::*pave-etl*",
      "arn:aws:s3:::*pave-client-datasets*",
      "arn:aws:s3:::*pave-api-sink*",
      "arn:aws:s3:::*pave-client-datasets*",
      "arn:aws:s3:::cf-templates-u3813ubkkdtt-us-east-1", # SFTP bucket
      "arn:aws:s3:::*pave-rds-backups-*",
    ]
  }
}

resource "aws_iam_policy" "pave_etl_s3_access" {
  name        = "PaveETLS3Access"
  description = "Allows read/write to ETL and client datasets buckets."
  policy      = data.aws_iam_policy_document.pave_etl_s3_access.json
}


# EKS

data "aws_iam_policy_document" "eks_user" {
  statement {
    sid       = "EKSUser"
    effect    = "Allow"
    actions   = ["eks:DescribeCluster"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "eks_user" {
  name        = "EKSUser"
  description = "Allows users to interact with EKS clusters.."
  policy      = data.aws_iam_policy_document.eks_user.json
}

data "aws_iam_policy_document" "eks_full_access" {
  statement {
    sid     = "EKSFullAccess"
    effect  = "Allow"
    actions = ["eks:*"]
    # TODO: this policy is too wide! KubernetesClusterView role could delete the
    #       production EKS cluster by mistake
    resources = ["*"]
  }
}

resource "aws_iam_policy" "eks_full_access" {
  name        = "EKSFullAccess"
  description = "Allows users to administer EKS clusters"
  policy      = data.aws_iam_policy_document.eks_full_access.json
}

# Athena

data "aws_iam_policy_document" "pave_athena_s3_access" {
  statement {
    sid = "PaveAthenaS3Access"

    effect = "Allow"

    actions = [
      # Object level
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:AbortMultipartUpload",
      # Bucket level
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::*pave-athena*",
    ]
  }
}

resource "aws_iam_policy" "pave_athena_s3_access" {
  name        = "PaveAthenaS3Access"
  description = "Allows read/write to Athena buckets."
  policy      = data.aws_iam_policy_document.pave_athena_s3_access.json
}


# RDS

resource "aws_iam_policy" "rds_dev_policy" {
  path        = "/"
  description = "Rds dev instance access policy only"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : "rds:*",
        "Resource" : ["arn:aws:rds:us-east-1:361452620376:db:dev-pave-postgres"]
      },
    ]
  })
}


# S3

resource "aws_iam_policy" "s3_dev_policy" {
  path        = "/"
  description = "s3 dev buckets access policy only"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : "s3:*",
        "Resource" : ["arn:aws:s3:::pave-*-development"]
      },
    ]
  })
}

resource "aws_iam_policy" "s3_athena_read_write" {
  path        = "/"
  description = "Access to S3 Athena bucket for analytics work."
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "ListObjectsInBucket",
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : ["arn:aws:s3:::pave-athena-global"]
      },
      {
        "Sid" : "AllObjectActions",
        "Effect" : "Allow",
        "Action" : "s3:*Object*",
        "Resource" : ["arn:aws:s3:::pave-athena-global"]
      }
    ]
  })
}

resource "aws_iam_policy" "s3_dev_readonly" {
  path        = "/"
  description = "Read only access to all S3 buckets in Development environment."
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "ReadOnlyActions",
        "Effect" : "Allow",
        "Action" : ["s3:Head*", "s3:Get*", "s3:List*"],
        "Resource" : ["arn:aws:s3:::pave-*-development"]
      }
    ]
  })
}