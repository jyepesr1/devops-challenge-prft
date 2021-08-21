# # VPC outputs
output "vpc_id" {
  value = module.infra[0].vpc_id
}

output "vpc_cidr_block" {
  value = module.infra[0].vpc_cidr_block
}

output "private_subnets" {
  value = module.infra[0].private_subnets
}

output "public_subnets" {
  value = module.infra[0].public_subnets
}

output "private_route_table_ids" {
  value = module.infra[0].private_route_table_ids
}

output "public_route_table_ids" {
  value = module.infra[0].public_route_table_ids
}

# Security groups outputs
output "external_ssh_sg_id" {
  value = module.infra[0].external_ssh_sg_id
}

output "external_web_sg_id" {
  value = module.infra[0].external_web_sg_id
}

output "internal_ssh_sg_id" {
  value = module.infra[0].internal_ssh_sg_id
}

output "internal_web_sg_id" {
  value = module.infra[0].internal_web_sg_id
}

output "kms_key_alias" {
  value = module.infra[0].kms_key_alias
}

output "kms_key_arn" {
  value = module.infra[0].kms_key_arn
}

output "kms_key_id" {
  value = module.infra[0].kms_key_id
}

output "private_route_table_count" {
  value = module.infra[0].private_route_table_count
}

output "public_route_table_count" {
  value = module.infra[0].public_route_table_count
}
