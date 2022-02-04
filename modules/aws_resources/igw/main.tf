resource "aws_internet_gateway" "manage-igw" {
    vpc_id = var.vpc_id
    tags = {
        Name = var.name_tag
    }
}
