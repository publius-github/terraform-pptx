variable "service" {
  default = "eks"
}

variable "environment" {
  default = {
    nonproduction = "nonprod"
    production    = "prod"
  }
}

variable "region" {
  default = {
    nonproduction = "us-east-1"
    production    = "us-east-1"
  }
}

variable "owner" {
  default = {
    nonproduction = "user1@example.com"
    production    = "user2@example.com"
  }
}

variable "organization_name" {
  default = "demo-2"
}

variable "vpc_cidr_block" {
  default = {
    nonproduction = "10.1.0.0/16"
    production    = "10.2.0.0/16"
  }
}

variable "az_count" {
  default = {
    nonproduction = "3"
    production    = "3"
  }
}

variable "subnet_length" {
  default = {
    nonproduction = "4"
    production    = "4"

  }
}


variable "godelers" {
  default = {
    ivan      = "dev"
    andrei    = "sdet"
    ayanami   = "qa"
    misato    = "adc"
  }
}