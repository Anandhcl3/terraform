output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnet-public.subnet_id
}

output "private_subnet_id" {
  value = module.subnet-private.subnet_id
}

output "igw_id" {
  value = module.internet_gateway.igw_id
}

output "rt-public" {
  value = module.route_table_public.rt-public-id
}

output "rt-private" {
  value = module.route_table_private.rt-private-id
}

output "nat_gw_id" {
  value = module.nat_gw.nat_gw_id
}
