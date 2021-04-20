# The VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "devlopment"
  }
}

# Internet Gateway (How we will be able to talk to  the outside world)

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc.id


}

# Route Table (Allow internet traffic on IPv4 and IPv6)
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "devlopment"
  }
}

# Subnets 
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "Public devlopment subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = "Private devlopment subnet"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web_traffic.id]

}

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.internet_gw]
}


