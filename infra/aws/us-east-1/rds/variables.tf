variable "identifier" {}
variable "engine" {}
variable "engine_version" {}
variable "database_name" {}
variable "username" {}
variable "backup_retention_period" {}
variable "deletion_protection" {
  default = false
}
variable "create_monitoring_role" {
  default = false
}
variable "snapshot_identifier" {
  default = null
}
variable "replica_count" {}
variable "instance_type" {}
variable "instance_type_replica" {}
variable "replica_scale_enabled" {}
variable "publicly_accessible" {}
variable "tags" {}
variable "region" {}
variable "replica_scale_max" {}
variable "replica_scale_min" {}
