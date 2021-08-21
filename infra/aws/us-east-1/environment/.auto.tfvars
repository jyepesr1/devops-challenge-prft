environment = "production"
region      = "us-east-1"
vpc_cidr    = "10.10.0.0/16"
# CIDRs of subnets
public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnets = ["10.10.8.0/21", "10.10.16.0/21"]
# If true, one NAT GW will be used for all private IPs (not recommended in prod)
single_nat_gateway = true
# CIDRs to allow egress/ingress. Include this vpc and other CIDR blocks (especially admin VPC) after which will get added to ACL/SGs
# This includes CIDRs for VPN/Office networks
trusted_networks = [
  "10.10.0.0/16" # dev
]
# if true, will allow 443/80 from 0.0.0.0/0
allow_public_ingress = true
# set custom domain servers
enable_dhcp_options = false
public_subnet_tags = {
  "kubernetes.io/cluster/johanyepes-cluster" = "shared"
  "kubernetes.io/role/elb"                 = 1
  "Owner" = "johanyepes@hotmail.com"
}
private_subnet_tags = {
  "kubernetes.io/cluster/johanyepes-cluster" = "shared"
  "kubernetes.io/role/internal-elb"        = 1
  "Owner" = "johanyepes@hotmail.com"
}
tags = {
  Owner = "johanyepes@hotmail.com"
}
create_ecr = true
ecr_names = ["demo-app"]