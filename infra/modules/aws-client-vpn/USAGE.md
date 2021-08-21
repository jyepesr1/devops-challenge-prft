## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.vpn_logs_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.vpn_logs_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_ec2_client_vpn_authorization_rule.vpn_authorization_rule_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_authorization_rule) | resource |
| [aws_ec2_client_vpn_authorization_rule.vpn_authorization_rule_peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_authorization_rule) | resource |
| [aws_ec2_client_vpn_endpoint.client_vpn_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_endpoint) | resource |
| [aws_ec2_client_vpn_network_association.vpn_network_association_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_network_association) | resource |
| [aws_ec2_client_vpn_route.vpn_route_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_route) | resource |
| [aws_ec2_client_vpn_route.vpn_route_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_route) | resource |
| [aws_s3_bucket.coast-vpn-certificates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.coast-vpn-certificates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_kms_key.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_security_groups.vpn_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_groups) | data source |
| [aws_subnet_ids.admin_private_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_vpc_name"></a> [aws\_vpc\_name](#input\_aws\_vpc\_name) | n/a | `any` | n/a | yes |
| <a name="input_client_acm_arn"></a> [client\_acm\_arn](#input\_client\_acm\_arn) | The ARN of the client certificate | `any` | n/a | yes |
| <a name="input_client_cidr_block"></a> [client\_cidr\_block](#input\_client\_cidr\_block) | Block of ips to be assigned to the VPN users, specify a client CIDR range that contains twice the number of IP addresses that you plan to support on the Client VPN endpoint. Since a portion of the range is also used to support the availability model of the Client VPN endpoint | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_peering_cidrs"></a> [peering\_cidrs](#input\_peering\_cidrs) | CIDRs of the other VPC you want to get access through admin VPC (e.g. staging, prod) | `set(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_server_acm_arn"></a> [server\_acm\_arn](#input\_server\_acm\_arn) | The ARN of the ACM server certificate | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |
| <a name="input_transport_protocol"></a> [transport\_protocol](#input\_transport\_protocol) | n/a | `string` | `"udp"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_client_arn"></a> [vpn\_client\_arn](#output\_vpn\_client\_arn) | n/a |
| <a name="output_vpn_client_cidr"></a> [vpn\_client\_cidr](#output\_vpn\_client\_cidr) | n/a |
| <a name="output_vpn_client_dns_name"></a> [vpn\_client\_dns\_name](#output\_vpn\_client\_dns\_name) | n/a |
| <a name="output_vpn_client_id"></a> [vpn\_client\_id](#output\_vpn\_client\_id) | n/a |
