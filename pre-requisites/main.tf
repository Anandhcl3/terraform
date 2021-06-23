module "aws_pre-requisites" {
  source = "../modules/pre-requisites"
  bucket_name = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}

##
