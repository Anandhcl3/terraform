
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "environment" {}

variable "project" {
  default = ""
}

variable "ami_id" {
  default = ""
}
