resource "aws_cloudwatch_log_group" "vpn_logs_group" {
  name              = "awslogs-client-vpn-${var.tags.Name}"
  retention_in_days = var.logs_retention_days
}

resource "aws_cloudwatch_log_stream" "vpn_logs_stream" {
  name           = "client-vpn-log-stream-${var.tags.Name}"
  log_group_name = aws_cloudwatch_log_group.vpn_logs_group.name
}

resource "aws_security_group" "vpn" {
  description = "Allow vpn access"
  name        = "vpn-sg-${var.tags.Name}"
  vpc_id      = data.terraform_remote_state.environment.outputs.vpc_id
  tags = merge(
    {
      "Name" = "vpn-sg-${var.tags.Name}"
    },
    var.tags,
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "vpn" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpn.id
}

resource "aws_ec2_client_vpn_endpoint" "client_vpn_endpoint" {
  description            = "VPN connection"
  server_certificate_arn = var.server_acm_arn
  client_cidr_block      = var.client_cidr_block
  split_tunnel           = true
  tags                   = var.tags

  authentication_options {
    type                       = var.authentication_type
    active_directory_id        = var.authentication_type == "directory-service-authentication" ? var.active_directory_id : null
    saml_provider_arn          = var.authentication_type == "federated-authentication" ? var.saml_provider_arn : null
    root_certificate_chain_arn = var.authentication_type == "certificate-authentication" ? var.client_acm_arn : null
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn_logs_group.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn_logs_stream.name
  }
}

resource "aws_ec2_client_vpn_network_association" "vpn_network_association_admin" {
  count = length(data.terraform_remote_state.environment.outputs.private_subnets)

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.id
  subnet_id              = data.terraform_remote_state.environment.outputs.private_subnets[count.index]
  security_groups        = [aws_security_group.vpn.id]
}

resource "aws_ec2_client_vpn_authorization_rule" "vpn_authorization_rule_admin" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.id
  target_network_cidr    = data.terraform_remote_state.environment.outputs.vpc_cidr_block
  authorize_all_groups   = true
}

resource "aws_ec2_client_vpn_authorization_rule" "vpn_authorization_rule_peering" {
  for_each = var.peering_cidrs

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.id
  target_network_cidr    = each.value
  authorize_all_groups   = true
}

locals {
  vpn_routes = [for pair in setproduct(var.peering_cidrs, data.terraform_remote_state.environment.outputs.private_subnets) : {
    peering_cidr = pair[0]
    subnet_id    = pair[1]
    }
  ]

}

resource "aws_ec2_client_vpn_route" "vpn_route" {
  count = length(local.vpn_routes)

  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.id
  destination_cidr_block = local.vpn_routes[count.index].peering_cidr
  target_vpc_subnet_id   = local.vpn_routes[count.index].subnet_id
}
