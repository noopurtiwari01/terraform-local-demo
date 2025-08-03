variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [{
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    }, {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }]
}

resource "null_resource" "ingress_rules" {
    provisioner "local-exec" {
      command = "echo Simulating security group with dynamic ingress rules"
    }
}

output "simulated_ingress_rules" {
  value = var.ingress_rules
}

#-------------------------------------------------------
# Example of dynamic Block with aws_security_group
#--------------------------------------------------------
# provider "aws" {
#   region = "us-east-1"
#   # Assumes credentials are already set up (via AWS CLI config or env vars)
# }

# variable "ingress_rules" {
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))

#   default = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }

# resource "aws_security_group" "dynamic_sg" {
#   name        = "dynamic-sg"
#   description = "Security group with dynamic ingress rules"
#   vpc_id      = "your-vpc-id-here" # 🔁 Replace with actual VPC ID

#   dynamic "ingress" {             # generates one ingress block per rule
#     for_each = var.ingress_rules
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#     }
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }