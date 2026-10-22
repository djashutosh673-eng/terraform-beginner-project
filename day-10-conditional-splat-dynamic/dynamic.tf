
variable "ingress_ports" {
  description = "Ports for the example security group"
  type        = list(number)
  default     = [22, 80, 443]
}

resource "aws_security_group" "dynamic_demo" {
  name        = "terraform-day10-dynamic-demo"
  description = "Security group demonstrating Terraform dynamic blocks"

  dynamic "ingress" {
    for_each = var.ingress_ports

    content {
      description = "Allow TCP port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  }
}
