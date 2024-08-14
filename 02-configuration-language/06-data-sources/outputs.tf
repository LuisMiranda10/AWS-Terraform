output "caller_identity" {
  value = {
    account_id = data.aws_caller_identity.current.account_id
    user_id = data.aws_caller_identity.current.user_id
  }
}

output "data_bucket" {
    value = {
        arn = data.aws_s3_bucket.meu_bucket_data.arn
        domain_name = data.aws_s3_bucket.meu_bucket_data.bucket_domain_name
    }
}

output "dynamodb" {
  value = [
    local.dynamodb_table_arn 
  ]
}