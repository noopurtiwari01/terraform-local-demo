terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "~> 2.1"
        }
    }

    required_version = ">= 1.0.0"
}

# This Terraform configuration uses the local provider to create a file
provider "local" {}

resource "local_file" "dynamic" {
    content = var.content
    filename = "${path.module}/${var.filename}"
}