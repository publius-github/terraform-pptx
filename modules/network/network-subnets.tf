data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = lookup(var.az_count, terraform.workspace, "3")
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.default_vpc.cidr_block, lookup(var.subnet_length, terraform.workspace), count.index + 3)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet-public.${terraform.workspace}"
  }
}

resource "aws_subnet" "private" {
  count             = lookup(var.az_count, terraform.workspace, "3")
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.default_vpc.cidr_block, lookup(var.subnet_length, terraform.workspace), count.index + 6)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet-private.${terraform.workspace}"
  }
}
