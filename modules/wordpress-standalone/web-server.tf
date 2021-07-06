resource "aws_instance" "example" {

  ami                    = var.ami_id
  instance_type          = var.web_instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "var.environment-var.project-ec2"
  }
}
