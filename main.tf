resource "aws_s3_bucket" "mybucket" {
  bucket = "${var.bucket_prefix}-terraform-s3"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key = var.index_config.key_name
  source = var.index_config.source_name
  acl = var.index_config.acl
  content_type = var.index_config.content_type
}

resource "aws_s3_object" "logo" {
  bucket = aws_s3_bucket.mybucket.id
  key = var.logo_config.key_name
  source = var.logo_config.source_name
  acl = var.logo_config.acl
}

resource "aws_s3_object" "qrCode" {
  bucket = aws_s3_bucket.mybucket.id
  key = var.qrCode_config.key_name
  source = var.qrCode_config.source_name
  acl = var.qrCode_config.acl
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = var.website_document
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}