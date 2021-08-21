output "vpn_client_cidr" {
  value = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.client_cidr_block
}

output "vpn_client_id" {
  value = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.id
}

output "vpn_client_dns_name" {
  value = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.dns_name
}

output "vpn_client_arn" {
  value = aws_ec2_client_vpn_endpoint.client_vpn_endpoint.arn
}