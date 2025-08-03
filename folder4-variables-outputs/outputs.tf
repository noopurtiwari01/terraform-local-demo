# The resource still runs and creates the file even if outputs.tf is commented out
# It's just to show how outputs can be used in other modules later (after applying)
output "file_path" {
    value = local_file.dynamic.filename
}