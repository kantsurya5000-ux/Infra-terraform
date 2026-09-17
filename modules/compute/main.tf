resource "azurerm_network_interface" "nics" {
 for_each = var.nics
 name = each.value.name
 location = each.value.location
 resource_group_name = each.value.resource_group_name

 ip_configuration {
   name = each.value.name
   subnet_id =  var.subnet_ids[each.value.subnet_key]
   public_ip_address_id = azurerm_public_ip.pip[each.key].id
   private_ip_address_allocation = each.value.private_ip_address_allocation

 }


  
}

resource "azurerm_public_ip" "pip" {
    for_each = var.pip
    name = each.value.name
    location = each.value.name
    resource_group_name = each.value.resource_group_name
    allocation_method = each.value.allocation_method
  
}


resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.vms
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    size = each.value.size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    network_interface_ids = [azurerm_network_interface.nics[each.key].id]
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"

    }
    source_image_reference {
      publisher = "Cononical"
      offer = "0001-com-ubuntu-server-jammy"
      sku = "22_04-lts"
      version = "latest"


    }
  
}

resource "azurerm_network_security_group" "nsgs" {
    for_each = var.nsgs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    dynamic "security_rule" {
        for_each = var.security_rules

        content {
          name = security_rule.value.name
          priority = security_rule.value.priority
          direction = security_rule.value.direction
          access = security_rule.value.access
          protocol = security_rule.value.protocol
          source_port_range = "*"
          destination_port_range = "*"
          source_address_prefix = "*"
          destination_address_prefix = "*"
        }

      
    }
}

resource "azurerm_network_interface_security_group_association" "nsga" {
    for_each = var.nsga
    network_interface_id = azurerm_network_interface.nics[each.key].id
    network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
  
}


  
