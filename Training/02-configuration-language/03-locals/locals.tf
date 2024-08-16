locals {
    namespaced_service_name = "${var.service_name}-${var.environment}"

    required_tags = {
        "my-tag-db-aws" = "tf-train"
        "CreateAt" = "2024-08-07"
    }

    commom_tags = merge(local.required_tags, var.tags)
}