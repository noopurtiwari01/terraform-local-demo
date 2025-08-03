# Below output will display the list of fruits defined in the variable
output "fruits_list" {
  value = var.fruits
}

# Expected output:
#
# fruits_list = tolist([
#   "apple",
#   "banana",
#   "cherry",
# ])
