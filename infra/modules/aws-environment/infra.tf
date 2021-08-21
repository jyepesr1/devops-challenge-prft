module "infra" {
  count                = var.create_admin ? 0 : 1
  source               = "../aws-infra"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  vpc_azs              = var.vpc_azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  single_nat_gateway   = var.single_nat_gateway
  trusted_networks     = var.trusted_networks
  allow_public_ingress = var.allow_public_ingress

  enable_dhcp_options              = var.enable_dhcp_options
  dhcp_options_domain_name_servers = var.dhcp_options_domain_name_servers
  public_subnet_tags               = var.public_subnet_tags
  private_subnet_tags              = var.private_subnet_tags

  create_external_ssh_sg = false
  create_external_web_sg = false
  create_internal_ssh_sg = false
  create_internal_web_sg = false

  tags = var.tags
}
