## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-security-groups"></a> [aws-security-groups](#module\_aws-security-groups) | ../aws-security-groups | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../aws-vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_kms_alias.env_key_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.env_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_public_ingress"></a> [allow\_public\_ingress](#input\_allow\_public\_ingress) | If true, this will create ACL rules to allow web traffic. Required if you want any outbound connections | `bool` | `false` | no |
| <a name="input_create_efs_sg"></a> [create\_efs\_sg](#input\_create\_efs\_sg) | n/a | `bool` | `false` | no |
| <a name="input_create_external_ssh_sg"></a> [create\_external\_ssh\_sg](#input\_create\_external\_ssh\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_external_web_sg"></a> [create\_external\_web\_sg](#input\_create\_external\_web\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_ecs_sg"></a> [create\_internal\_ecs\_sg](#input\_create\_internal\_ecs\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_ssh_sg"></a> [create\_internal\_ssh\_sg](#input\_create\_internal\_ssh\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_web_sg"></a> [create\_internal\_web\_sg](#input\_create\_internal\_web\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_jenkins_sg"></a> [create\_jenkins\_sg](#input\_create\_jenkins\_sg) | n/a | `bool` | `false` | no |
| <a name="input_create_vpn_sg"></a> [create\_vpn\_sg](#input\_create\_vpn\_sg) | n/a | `bool` | `false` | no |
| <a name="input_dhcp_options_domain_name_servers"></a> [dhcp\_options\_domain\_name\_servers](#input\_dhcp\_options\_domain\_name\_servers) | Specify a list of DNS server addresses for DHCP options set, default to AWS provided | `list(string)` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| <a name="input_enable_dhcp_options"></a> [enable\_dhcp\_options](#input\_enable\_dhcp\_options) | Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | n/a | `string` | `false` | no |
| <a name="input_trusted_networks"></a> [trusted\_networks](#input\_trusted\_networks) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_sg_id"></a> [efs\_sg\_id](#output\_efs\_sg\_id) | n/a |
| <a name="output_external_ssh_sg_id"></a> [external\_ssh\_sg\_id](#output\_external\_ssh\_sg\_id) | Security groups outputs |
| <a name="output_external_web_sg_id"></a> [external\_web\_sg\_id](#output\_external\_web\_sg\_id) | n/a |
| <a name="output_internal_ecs_sg_id"></a> [internal\_ecs\_sg\_id](#output\_internal\_ecs\_sg\_id) | n/a |
| <a name="output_internal_ssh_sg_id"></a> [internal\_ssh\_sg\_id](#output\_internal\_ssh\_sg\_id) | n/a |
| <a name="output_internal_web_sg_id"></a> [internal\_web\_sg\_id](#output\_internal\_web\_sg\_id) | n/a |
| <a name="output_jenkins_sg_id"></a> [jenkins\_sg\_id](#output\_jenkins\_sg\_id) | n/a |
| <a name="output_kms_key_alias"></a> [kms\_key\_alias](#output\_kms\_key\_alias) | n/a |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | n/a |
| <a name="output_private_route_table_count"></a> [private\_route\_table\_count](#output\_private\_route\_table\_count) | n/a |
| <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids) | n/a |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | n/a |
| <a name="output_public_route_table_count"></a> [public\_route\_table\_count](#output\_public\_route\_table\_count) | n/a |
| <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC outputs |
| <a name="output_vpn_sg_id"></a> [vpn\_sg\_id](#output\_vpn\_sg\_id) | n/a |
