# main.tf
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

# When destroy command is run, it will delete hello.txt as it is a resource
# directly managed by Terraform
resource "local_file" "hello" {
    content  = "Hello from Terraform!"
    filename = "${path.module}/hello.txt"
}
