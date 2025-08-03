output "env_file_content" {
    value = "Created env.txt file with: ${var.is_production ? "Production" : "Development"} Environment"
}