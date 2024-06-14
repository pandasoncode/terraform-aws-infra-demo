resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}public-route-table"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [aws_internet_gateway.igw, aws_route_table.public_route_table]
}

resource "aws_route_table_association" "public_route_table_association" {
  count          = length(aws_subnet.public_subnets)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnets[count.index].id

  depends_on = [aws_route_table.public_route_table, aws_subnet.public_subnets]
}



resource "aws_route_table" "private_route_tables" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-private-route-table-${count.index + 1}-${var.availability_zones[count.index]}"
  }
}

resource "aws_route" "private_routes" {
  count                  = length(aws_route_table.private_route_tables)
  route_table_id         = aws_route_table.private_route_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}

resource "aws_route_table_association" "private_route_table_associations" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_tables[count.index].id
}
