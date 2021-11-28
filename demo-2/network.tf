module "network" {
  source = "../modules/network/"

  vpc_cidr_block = lookup(var.vpc_cidr_block, terraform.workspace)
  az_count       = lookup(var.az_count, terraform.workspace)
  subnet_length  = lookup(var.subnet_length, terraform.workspace)
}
