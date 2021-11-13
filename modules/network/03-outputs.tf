output "vpc_id" {
  value = aws_vpc.default_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.default_vpc.cidr_block
}

output "private_subnet_ids" {
  value = join(",", aws_subnet.private.*.id)
}

output "public_subnet_ids" {
  value = join(",", aws_subnet.public.*.id)
}

output "nat_public_ips" {
  value = join(",", aws_nat_gateway.nat_gw.*.public_ip)
}

output "route_table_public_id" {
  value = aws_route_table.public.id
}

output "route_table_private_ids" {
  value = join(",", aws_route_table.private.*.id)
}
