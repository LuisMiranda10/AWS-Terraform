resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    name = local.namespaced_service_name 
  }
}