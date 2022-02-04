resource "aws_route_table" "rt-private" {
  vpc_id = var.vpc_id
    route {
        cidr_block = var.cidr_block
        nat_gateway_id = var.nat_gateway_id

    }
    tags = {
        Name = "${var.name_tag}"
      }
 }
