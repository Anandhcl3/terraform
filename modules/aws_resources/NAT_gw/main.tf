resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name_tag
  }
}

resource "aws_eip" "nat_gateway" {
  vpc = true
  tags = {
    Name = var.name_tag
  }
}
