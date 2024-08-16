variable "environment" {
  type = string
  description = ""
} 

variable "aws_region" {
    type = string
    description = ""
    # default = "sa-east-1"

    validation {
      condition = var.aws_region == "sa-east-1"
      error_message = "Only the sa-east-1 region is allowed" 
    }
}

variable "aws_profile"{
    type = string
    description = ""
    default = "tf_LuisMiranda"
}

variable "tags" {
    type = map(string)
    description = ""
    default = {}
}

variable "dynamodb_field_list" {
    type = list(string)
    description = ""
    default = [ "UserID", "GameTitle" ]
}

variable "database_config" {
    type = object({
        table_name = string
        read_capacity = optional(number, 3)
        write_capacity = optional(number , 3)
        deletion_protection = optional(bool, false)
        hash_key = object({
          name = string
          type = string
        })
        range_key = object({
          name = string
          type = string
        })
    })
    description = ""
    default = {
      table_name = "GameScores"
      hash_key = {
          name = "UserId"
          type = "S"
        }
      range_key = {
          name = "GameTitle"
          type = "S"
        }
    }
}

variable "cidr_block" {
  type = string
  description = ""
  default = "10.0.0.0/16"
  sensitive = true
}

variable "service_name" {
  type = string
  description = ""
  default = "game-store-service"
}