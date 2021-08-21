region              = "us-east-1"
client_cidr_block   = "10.0.0.0/22"
peering_cidrs       = []
authentication_type = "federated-authentication"
saml_provider_arn   = "arn:aws:iam::361452620376:saml-provider/AWS_SSO_DEV"
server_acm_arn      = "arn:aws:acm:us-east-1:361452620376:certificate/7b0875d6-53ac-4b00-a39a-7653ebe353b4"
tags = {
  Name      = "Pave-developers"
  Terraform = "true"
}
source_vpc = "development"