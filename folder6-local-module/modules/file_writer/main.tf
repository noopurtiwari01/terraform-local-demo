# main.tf file inside local_modules/modules/file_writer
# It will pick up the variables and version info etc. defined in the parent module
resource "local_file" "this" {
  content  = var.content
  filename = "${path.module}/${var.filename}"
}