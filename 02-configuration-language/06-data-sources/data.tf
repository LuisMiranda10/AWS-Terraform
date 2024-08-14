data "aws_caller_identity" "current"{}

data "aws_s3_bucket" "meu_bucket_data" {
  bucket = "terraform-train-luis"
}

data "aws_dynamodb_table" "tableName" {
  name = "my-table-Luis-aws"
}