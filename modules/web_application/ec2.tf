resource "aws_instance" "web-server-instance" {
  ami               = data.aws_ami.ubuntu.id 
  instance_type     = var.instance_type

  network_interface {
    device_index         = 0
    network_interface_id = var.network_interface
  }

    key_name          = "kr_pub"

  user_data = <<-EOF
                  #!/bin/bash
                  sudo apt update -y
                  sudo apt install apache2 -y
                  sudo systemctl start apache2
                  sudo bash -c 'echo Hello world > /var/www/html/index.html'
                  EOF


  tags = {
    Name = "web-server"
  }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}