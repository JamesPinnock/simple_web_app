

output "server_public_ip" {
  value = module.VPC_networking.server_public_ip
}

output "server_private_ip" {
  value = module.web_application.server_private_ip

}

output "server_id" {
  value = module.web_application.server_id
}