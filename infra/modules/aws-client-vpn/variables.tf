variable "client_cidr_block" {
  description = "Block of ips to be assigned to the VPN users, specify a client CIDR range that contains twice the number of IP addresses that you plan to support on the Client VPN endpoint. Since a portion of the range is also used to support the availability model of the Client VPN endpoint"
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "region" {}

variable "peering_cidrs" {
  type        = set(string)
  description = "CIDRs of the other VPC you want to get access through admin VPC (e.g. staging, prod)"
}

variable "transport_protocol" {
  default = "udp"
}

variable "server_acm_arn" {
  description = "The ARN of the ACM server certificate"
}

variable "client_acm_arn" {
  description = "The ARN of the client certificate. The certificate must be signed by a certificate authority (CA) and it must be provisioned in AWS Certificate Manager (ACM). Only necessary when type is set to certificate-authentication"
  default     = ""
}

variable "authentication_type" {
  description = "Information about the authentication method to be used to authenticate clients."
}

variable "active_directory_id" {
  description = "The ID of the Active Directory to be used for authentication if authentication_type is directory-service-authentication"
  default     = ""
}

variable "saml_provider_arn" {
  description = "The ARN of the IAM SAML identity provider if authentication_type is federated-authentication"
  default     = ""
}

variable "logs_retention_days" {
  default = 90
}

variable "source_vpc" {}