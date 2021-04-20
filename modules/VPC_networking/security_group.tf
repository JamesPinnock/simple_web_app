variable "port_numbers" {
  default = {
    "SSH"   = 22
    "HTTPS" = 443
    "HTTP"  = 80
  }

}

resource "aws_security_group" "allow_web_traffic" {
  name        = "allow_web_based_traffic"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  
  dynamic ingress {
    for_each = var.port_numbers
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}