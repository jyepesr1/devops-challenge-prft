resource "random_password" "master" {
  length = 20
}

module "rds" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "5.2.0"

  name                  = var.identifier
  engine                = var.engine
  engine_version        = var.engine_version
  instance_type         = var.instance_type
  instance_type_replica = var.instance_type_replica
  database_name         = var.database_name
  username              = var.username
  replica_scale_enabled = var.replica_scale_enabled
  replica_scale_max     = var.replica_scale_max
  replica_scale_min     = var.replica_scale_min

  vpc_id                     = data.terraform_remote_state.environment.outputs.vpc_id
  subnets                    = data.terraform_remote_state.environment.outputs.private_subnets
  create_security_group      = true
  allowed_cidr_blocks        = [data.terraform_remote_state.environment.outputs.vpc_cidr_block]
  kms_key_id                 = data.terraform_remote_state.environment.outputs.kms_key_arn
  security_group_description = "RDS Instance for Devops challenge"
  security_group_tags        = var.tags

  replica_count                       = var.replica_count
  iam_database_authentication_enabled = false
  password                            = random_password.master.result
  create_random_password              = false
  backup_retention_period             = var.backup_retention_period

  apply_immediately   = true
  skip_final_snapshot = true
  deletion_protection = var.deletion_protection
  publicly_accessible = var.publicly_accessible

  db_parameter_group_name         = aws_db_parameter_group.this.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.id
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  cluster_tags          = var.tags
  copy_tags_to_snapshot = true
  tags                  = var.tags
}

resource "aws_db_parameter_group" "this" {
  name        = "${var.identifier}-aurora-db-57-parameter-group"
  family      = "aurora-mysql5.7"
  description = "${var.identifier}-aurora-db-57-parameter-group"
  tags        = var.tags
}

resource "aws_rds_cluster_parameter_group" "this" {
  name        = "${var.identifier}-aurora-57-cluster-parameter-group"
  family      = "aurora-mysql5.7"
  description = "${var.identifier}-aurora-57-cluster-parameter-group"
  tags        = var.tags
}