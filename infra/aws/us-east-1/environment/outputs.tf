# # VPC outputs
output "vpc_id" {
  value = module.environment.vpc_id
}

output "vpc_cidr_block" {
  value = module.environment.vpc_cidr_block
}

output "private_subnets" {
  value = module.environment.private_subnets
}

output "public_subnets" {
  value = module.environment.public_subnets
}

output "private_route_table_ids" {
  value = module.environment.private_route_table_ids
}

output "public_route_table_ids" {
  value = module.environment.public_route_table_ids
}

# Security groups outputs
output "external_ssh_sg_id" {
  value = module.environment.external_ssh_sg_id
}

output "external_web_sg_id" {
  value = module.environment.external_web_sg_id
}

output "internal_ssh_sg_id" {
  value = module.environment.internal_ssh_sg_id
}

output "internal_web_sg_id" {
  value = module.environment.internal_web_sg_id
}

output "kms_key_alias" {
  value = module.environment.kms_key_alias
}

output "kms_key_arn" {
  value = module.environment.kms_key_arn
}

output "private_route_table_count" {
  value = module.environment.private_route_table_count
}

output "public_route_table_count" {
  value = module.environment.public_route_table_count
}
