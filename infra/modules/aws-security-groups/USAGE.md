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
| [aws_security_group.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.external_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.external_web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.internal_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.internal_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.internal_web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.external_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.external_web_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.external_web_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal_ecs_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal_ecs_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.internal_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.jenkins_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.jenkins_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.jenkins_jnlp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.trusted_networks_to_8000](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.trusted_networks_to_8080](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.trusted_networks_to_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.trusted_networks_to_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.vpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_efs_sg"></a> [create\_efs\_sg](#input\_create\_efs\_sg) | n/a | `bool` | `false` | no |
| <a name="input_create_external_ssh_sg"></a> [create\_external\_ssh\_sg](#input\_create\_external\_ssh\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_external_web_sg"></a> [create\_external\_web\_sg](#input\_create\_external\_web\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_ecs_sg"></a> [create\_internal\_ecs\_sg](#input\_create\_internal\_ecs\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_ssh_sg"></a> [create\_internal\_ssh\_sg](#input\_create\_internal\_ssh\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_internal_web_sg"></a> [create\_internal\_web\_sg](#input\_create\_internal\_web\_sg) | n/a | `bool` | `true` | no |
| <a name="input_create_jenkins_sg"></a> [create\_jenkins\_sg](#input\_create\_jenkins\_sg) | n/a | `bool` | `false` | no |
| <a name="input_create_vpn_sg"></a> [create\_vpn\_sg](#input\_create\_vpn\_sg) | n/a | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | n/a | yes |
| <a name="input_trusted_networks"></a> [trusted\_networks](#input\_trusted\_networks) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_sg_id"></a> [efs\_sg\_id](#output\_efs\_sg\_id) | EFS Security Group ID |
| <a name="output_external_ssh_sg_id"></a> [external\_ssh\_sg\_id](#output\_external\_ssh\_sg\_id) | External SSH Security Group ID |
| <a name="output_external_web_sg_id"></a> [external\_web\_sg\_id](#output\_external\_web\_sg\_id) | External Web Security Group ID |
| <a name="output_internal_ecs_sg_id"></a> [internal\_ecs\_sg\_id](#output\_internal\_ecs\_sg\_id) | Internal ECS Security Group ID |
| <a name="output_internal_ssh_sg_id"></a> [internal\_ssh\_sg\_id](#output\_internal\_ssh\_sg\_id) | Internal SSH Security Group ID |
| <a name="output_internal_web_sg_id"></a> [internal\_web\_sg\_id](#output\_internal\_web\_sg\_id) | Internal Web Security Group ID |
| <a name="output_jenkins_sg_id"></a> [jenkins\_sg\_id](#output\_jenkins\_sg\_id) | Jenkins Security Group ID |
| <a name="output_vpn_sg_id"></a> [vpn\_sg\_id](#output\_vpn\_sg\_id) | VPN Security Group ID |
