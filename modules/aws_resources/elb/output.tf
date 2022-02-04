output "elb_name" {
  value = aws_elb.elb_module.dns_name
}
