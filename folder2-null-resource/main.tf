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

# When destroy command is run, it won't delete script_output.txt
# as it is a side product created by running script
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "echo 'This is executed by Terraform!' > script_output.txt"
  }
}
