module "environment" {
  source = "../../../../modules/aws-environment"

  # Common vars
  ## list of AZs to create subnets in
  vpc_azs = ["${var.region}b", "${var.region}c"]
  ## CIDRs to allow egress/ingress. Include this vpc and other CIDR blocks (especially admin VPC) after which will get added to ACL/SGs
  ## This includes CIDRs for VPN/Office networks
  trusted_networks = var.trusted_networks
  ## Route53 private hosted zone to create
  create_hosted_zone = false
  ## Create or use this zone

  create_admin = var.create_admin
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  # CIDRs of subnets
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  # If true, one NAT GW will be used for all private IPs (not recommended in prod)
  single_nat_gateway = var.single_nat_gateway
  # If true, will create acl rules for these
  ssh_enabled = var.ssh_enabled
  vpn_enabled = var.vpn_enabled
  # if true, will allow 443/80 from 0.0.0.0/0
  allow_public_ingress = var.allow_public_ingress
  # set custom domain servers
  enable_dhcp_options = var.enable_dhcp_options
  # # ECR/ECS variables
  create_ecr          = var.create_ecr
  ecr_names           = var.ecr_names
  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
  tags                = var.tags
}