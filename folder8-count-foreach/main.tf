variable "fruits" {
    type = list(string)
    description = "List of fruits to be processed"
    default = ["apple", "banana", "cherry"]
}

# Using count
resource "null_resource" "fruit_files" {
    count = length(var.fruits)

    provisioner "local-exec" {
        command = "echo '${var.fruits[count.index]}' > ${var.fruits[count.index]}.txt"
    }
}

# Using for_each
resource "null_resource" "fruit_files_foreach" {
    for_each = toset(var.fruits)
    provisioner "local-exec" {
        command = "echo Fruit: ${each.key}"
    }
}