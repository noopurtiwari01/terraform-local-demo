# This Terraform configuration demonstrates the use of local_file data source
resource "null_resource" "write_file" {
    provisioner "local-exec" {
        command = "echo Overwritten by Terraform! > hello.txt"
    }
}

# Read the file
data "local_file" "original" {
  filename = "${path.module}/hello.txt"
}

# Expected output - content written by the null_resource
