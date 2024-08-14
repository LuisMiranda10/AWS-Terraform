environment = "prod"
aws_region = "sa-east-1"

database_config = {
      table_name = "GameScores"
      read_capacity = 5
      write_capacity = 5
      hash_key = {
          name = "UserId"
          type = "S"
        }
      range_key = {
          name = "GameTitle"
          type = "S"
        }
    }

tags = {
    "my-tag-db-aws" = "tf-train"
    "CreateAt" = "2024-08-07"
    "Env" = "prod"
}