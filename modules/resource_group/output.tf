output "resouce_groups" {
  value = {
    for key, rgs1 in azurerm_resource_group.rgs :
       key => rgs1.id  
      
    }
  }
