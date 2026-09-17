module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs



}

module "network" {
  source     = "../../modules/network"
  depends_on = [module.resource_group]
  vnets      = var.vnets
  subnets    = var.subnets

}

module "compute" {
  source         = "../../modules/compute"
  depends_on     = [module.network, module.resource_group]
  nics           = var.nics
  nsgs           = var.nsgs
  nsga           = var.nsga
  pip            = var.pip
  vms            = var.vms
  security_rules = var.security_rules
  subnet_ids = module.network.subnet_ids
  
  



}