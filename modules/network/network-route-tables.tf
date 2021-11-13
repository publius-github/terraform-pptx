resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name = "rt-public.${terraform.workspace}"
  }
}

resource "aws_route_table" "private" {
  count  = lookup(var.az_count, terraform.workspace, "3")
  vpc_id = aws_vpc.default_vpc.id

  tags = {
    Name = "rt-private.${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default_ig.id
}

resource "aws_route" "private" {
  count                  = lookup(var.az_count, terraform.workspace, "3")
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat_gw.*.id, count.index)
}

resource "aws_route_table_association" "public" {
  count          = lookup(var.az_count, terraform.workspace, "3")
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = lookup(var.az_count, terraform.workspace, "3")
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
