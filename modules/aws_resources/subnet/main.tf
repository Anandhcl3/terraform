resource "aws_subnet" "manage-subnet" {
    vpc_id =  var.vpc_id
    cidr_block = var.cidr_block
    tags = {
        Name = "${var.tag_name}"
    }
}
