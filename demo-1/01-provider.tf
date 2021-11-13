provider "aws" {
  region  = var.region
  profile = "godel"

  default_tags {
    tags = {
      environment = "test"
      owner       = var.owner
      service     = "terraform-demo"
    }
  }
}
