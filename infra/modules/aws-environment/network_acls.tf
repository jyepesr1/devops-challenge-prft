data "aws_network_acls" "public" {
  vpc_id = module.infra[0].vpc_id
  filter {
    name   = "association.subnet-id"
    values = module.infra[0].public_subnets
  }
}

resource "aws_network_acl_rule" "admin_allow_public_ingress_vpn" {
  count          = var.vpn_enabled && var.create_admin ? 1 : 0
  network_acl_id = element(tolist(data.aws_network_acls.public.ids), 0)
  rule_number    = 194
  egress         = false
  protocol       = "udp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1194
  to_port        = 1194
}

resource "aws_network_acl_rule" "admin_allow_public_ingress_ssh" {
  count          = var.ssh_enabled && var.create_admin ? 1 : 0
  network_acl_id = element(tolist(data.aws_network_acls.public.ids), 0)
  rule_number    = 122
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 22
  to_port        = 22
}
