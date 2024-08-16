terraform {
    required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2"
    }
  }
}

resource "random_pet" "string" {
  length = 4
}

variable "environment" {
  type = string
  default = "dev"
}

locals {
  literal_string = "literal string here"
  concatened_string = "${random_pet.string.id}-texto-aleatório-${var.environment}"
  
  encode = jsonencode({
    hello = "hello horld"
    foo = "bar"
  })

  decode = jsondecode(local.encode)
}

output "locals_output" {
  value = {
    literal_string = local.literal_string
    concatened_string = local.concatened_string

    json = local.encode
    decode_json = local.decode["foo"]
  }
}

