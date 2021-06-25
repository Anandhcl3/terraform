module "aws_pre-requisites" {
  source = "../modules/pre-requsities"
  bucket_name = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
}

##
