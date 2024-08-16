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

