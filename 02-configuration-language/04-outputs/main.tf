provider "aws" {
    region = "sa-east-1"
    profile = "tf_LuisMiranda"

    default_tags {
      tags = {
        "my-tag-db-aws" = "tf-train-outputs"
        "CreateAt" = "2024-08-07"
        }
    }
}

resource "random_pet" "bucket" {
  length = 6
}

resource "aws_s3_bucket" "random" {
  bucket = random_pet.bucket.id
}