provider "aws" {
  region  = lookup(var.region, terraform.workspace)
  profile = "godel"

  default_tags {
    tags = {
      environment = local.environment
      owner       = lookup(var.owner, terraform.workspace)
      service     = "terraform-demo"
    }
  }
}
