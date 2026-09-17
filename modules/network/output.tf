

output "subnet_ids" {
    value = {
        for key, subnets in azurerm_subnet.subnets :
        key=> subnets.id
    }
  
}

output "virtual_network_name" {
    value = {
        for key , vnet in azurerm_virtual_network.vnets :
        key => vnet.name
    }
  
}