locals {
  environment = terraform.workspace
  resource_name = "${var.organization_name}-${var.service}-${terraform.workspace}"
  policy_arn_prefix = "arn:${data.aws_partition.current.partition}:iam::aws:policy"
  account_id = data.aws_caller_identity.current.account_id
}
