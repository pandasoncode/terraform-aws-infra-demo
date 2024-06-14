resource "aws_subnet" "public_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index * 2)
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.vpc_name}-subnet-public-${count.index + 1}-${var.availability_zones[count.index]}"
  }

  depends_on = [aws_vpc.vpc]
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index * 2 + 1)
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.vpc_name}-subnet-private-${count.index + 1}-${var.availability_zones[count.index]}"
  }

  depends_on = [aws_vpc.vpc]
}
