provider "aws" {
  region = var.region
}

module "VPC_networking" {
  source = "./modules/VPC_networking"
}

module "web_application" {
  source            = "./modules/web_application"
  network_interface = module.VPC_networking.network_interface

}