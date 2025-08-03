# main.tf
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
  }
  required_version = ">= 1.0.0"
}

variable "messages" {
    default = ["Hello", "Hi", "Namaste", "Bonjour"]
}

# This Terraform configuration uses the local provider to create multiple files
provider "local" {}

# Create multiple files using a for_each loop
resource "local_file" "multi_files" {
    for_each = toset(var.messages)
    content = each.key
    filename = "${path.module}/${each.key}.txt"
}
