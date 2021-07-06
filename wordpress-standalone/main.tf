module "wordpress-standalone" {
  source = "../modules/wordpress-standalone"
  server_port = "var.server_port"
  environment = "var.environment"
  project    = "var.project"
  ami_id     = "var.ami_id"
  web_instance_type = "var.web_instance_type"
}
