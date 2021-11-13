resource "aws_vpc_dhcp_options" "default" {
  domain_name         = "${terraform.workspace}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = "dhcp.${terraform.workspace}"
  }
}

resource "aws_vpc_dhcp_options_association" "default" {
  vpc_id          = aws_vpc.default_vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.default.id
}
