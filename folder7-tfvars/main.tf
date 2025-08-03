
resource "null_resource" "env_file" {
    provisioner "local-exec" {
        command = "echo '${var.is_production ? "Production": "Development"} Environment' > env.txt"
    }
}