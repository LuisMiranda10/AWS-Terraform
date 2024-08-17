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
  key = "index.html"
  source = "my_music_site/index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "logo" {
  bucket = aws_s3_bucket.mybucket.id
  key = "LogoMyMusic.png"
  source = "my_music_site/LogoMyMusic.png"
  acl = "public-read"
}

resource "aws_s3_object" "qrCode" {
  bucket = aws_s3_bucket.mybucket.id
  key = "qrCode.png"
  source = "my_music_site/QR-Code.png"
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }
  depends_on = [ aws_s3_bucket_acl.example ]
}