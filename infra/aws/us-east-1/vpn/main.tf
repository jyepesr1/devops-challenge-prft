module "vpn" {
  source = "../../../../modules/aws-client-vpn"

  region              = var.region
  client_cidr_block   = var.client_cidr_block
  peering_cidrs       = var.peering_cidrs
  authentication_type = var.authentication_type
  saml_provider_arn   = var.saml_provider_arn
  server_acm_arn      = var.server_acm_arn
  source_vpc          = var.source_vpc
  tags                = var.tags
}