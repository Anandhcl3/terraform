


module "vpc" {
  source = "../modules/aws_resources/vpc"
  cidr = "10.0.0.0/16"
  name_tag = "manage_vpc"
}


module "subnet-public" {
  source = "../modules/aws_resources/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  tag_name   = "public-subnet"

}

module "subnet-private" {
  source = "../modules/aws_resources/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.2.0/24"
  tag_name   = "private-subnet"

}

module "internet_gateway" {
  source = "../modules/aws_resources/igw"
  vpc_id = module.vpc.vpc_id
  name_tag = "manage_igw"
}

module "route_table_public" {
  source = "../modules/aws_resources/route_table_public"
  vpc_id = module.vpc.vpc_id
  name_tag = "manage_public_rtb"
  cidr_block = "0.0.0.0/0"
  gateway_id = module.internet_gateway.igw_id

}


module "nat_gw" {
  source = "../modules/aws_resources/NAT_gw"
  subnet_id = module.subnet-public.subnet_id
  name_tag  = "manage_nat_gw"
}

module "route_table_private" {
  source = "../modules/aws_resources/route_table_private"
  vpc_id = module.vpc.vpc_id
  name_tag = "manage_private_rtb"
  cidr_block = "0.0.0.0/0"
  nat_gateway_id = module.nat_gw.nat_gw_id
}

module "public_subnet_assocation" {
  source = "../modules/aws_resources/route_table_association"
  subnet_id = module.subnet-public.subnet_id
  route_table_id = module.route_table_public.rt-public-id
}

module "private_subnet_assocation" {
  source = "../modules/aws_resources/route_table_association"
  subnet_id = module.subnet-private.subnet_id
  route_table_id = module.route_table_private.rt-private-id
}



/*
module "route_table_private" {
  source = "../modules/aws_resources/route_table_private"
  vpc_id = module.vpc.vpc_id
  name_tag = "manage_private_rtb"
  cidr_block = "0.0.0.0/0"
  gateway_id = module.internet_gateway.igw_id

}

/*
module "nat_gateway" {
  source = "../modules/aws_resources/igw"
  vpc_id = module.vpc.vpc_id
  name_tag = "manage_igw"
}
*/


/*
module "elb" {
  source = "../modules/aws_resources/elb"
}

module "asg" {
  source = "../modules/aws_resources/asg"
  elb_name = [module.elb.elb_name]
  aws_amis  = "ami-03fa4afc89e4a8a09"
  availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  key_name = "anandlavuzoho"
  instance_type = "t2.micro"
  asg_min = "1"
  asg_max = "2"
  asg_desired = "2"
}
*/
