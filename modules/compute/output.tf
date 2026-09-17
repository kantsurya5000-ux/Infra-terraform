output "network_inteface" {
    value = {
        for key, nic in azurerm_network_interface.nics :
        key => nic.id
    }
}
output "public_ip_address_id" {
    value = {
        for key, pip in azurerm_public_ip.pip :
        key => pip.id
    }
  
}

output "network_security_group_id" {
    value = {
        for key, nsg in azurerm_network_security_group.nsgs :
        key => nsg.id
    }
  
}

