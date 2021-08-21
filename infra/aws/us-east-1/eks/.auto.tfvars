environment                    = "production"
region                         = "us-east-1"
cluster_name                   = "johanyepes-cluster"
cluster_version                = "1.21"
cluster_enabled_log_types      = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
cluster_iam_role_name          = "johanyepes-cluster-role"
cluster_endpoint_public_access = true
write_kubeconfig               = true
fargate_profiles = {}
node_groups = {
  compute = {
    name_prefix      = "compute-"
    ami_type         = "AL2_x86_64"
    disk_size        = 8
    instance_types   = ["t3.large"]
    capacity_type    = "ON_DEMAND"
    desired_capacity = 2
    max_capacity     = 3
    min_capacity     = 2
  }
}
irsa_mapping = {
  demo-app = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "KMSAccess",
        "Effect" : "Allow",
        "Action" : [
          "kms:Get*",
          "kms:List*",
          "kms:Decrypt",
          "kms:Describe*",
        ],
        "Resource" : ["arn:aws:kms:us-east-1:241507129644:key/6f866ef0-4fc9-4e59-aa58-075f5ff4ba83", ]
      },
      {
        "Sid" : "SecretsManagerAccess",
        "Effect" : "Allow",
        "Action" : [
          "secretsmanager:GetSecretValue"
        ],
        "Resource" : ["arn:aws:secretsmanager:us-east-1:241507129644:secret:*"]
      }
    ]
  }
}
tags = {
  Owner = "johanyepes@hotmail.com"
}