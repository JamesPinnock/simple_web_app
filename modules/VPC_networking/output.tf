
output "network_interface" {

    value = aws_network_interface.web-server-nic.id
  
}

output "server_public_ip" {

  value = aws_eip.one.public_ip
  
}