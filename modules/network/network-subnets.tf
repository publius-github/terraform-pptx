data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = var.az_count
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.default_vpc.cidr_block, var.subnet_length, count.index + 3)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet-public.${terraform.workspace}"
  }
}

resource "aws_subnet" "private" {
  count             = var.az_count
  vpc_id            = aws_vpc.default_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.default_vpc.cidr_block, var.subnet_length, count.index + 6)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "subnet-private.${terraform.workspace}"
  }
}
