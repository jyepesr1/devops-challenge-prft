resource "aws_kms_key" "env_key" {
  description = "KMS key for ${var.environment} environment"
  tags = merge(var.tags, {
    Environment = var.environment
    Terraform   = "true"
  })
}

resource "aws_kms_alias" "env_key_alias" {
  name          = "alias/${var.environment}"
  target_key_id = aws_kms_key.env_key.key_id
}

