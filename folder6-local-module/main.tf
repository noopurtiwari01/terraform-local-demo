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

provider "local" {}

module "example" {
    source = "./modules/file_writer"
    content = "This is a dynamically created file."
    filename = "module_output.txt"
}
