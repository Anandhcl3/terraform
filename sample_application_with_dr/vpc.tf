provider "aws" {
  region = "ap-south-1"
}


module "vpc" {
  source = "modules/aws_resources/vpc"

  name = "aaahcl_vpc"

  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = true

  #enable_nat_gateway = true
  #single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "aaahcl"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "aaahcl_vpc"
  }
}
