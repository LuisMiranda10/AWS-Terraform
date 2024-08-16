output "bucket_arn" {
  value = aws_s3_bucket.random.arn
  description = "ARN"
  sensitive = false
}

output "pet_name" {
  value = random_pet.bucket.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.random.bucket_domain_name
}