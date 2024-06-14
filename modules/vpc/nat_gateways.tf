
resource "aws_eip" "ngw_eip" {
  tags = {
    Name = "${var.vpc_name}-ngw-eip"
  }
}

resource "aws_nat_gateway" "ngw" {
  subnet_id = aws_subnet.public_subnets[0].id
  tags = {
    Name = "${var.vpc_name}-ngw"
  }
  allocation_id = aws_eip.ngw_eip.id
}
