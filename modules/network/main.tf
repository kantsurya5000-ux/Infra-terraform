resource "azurerm_virtual_network" "vnets" {
    for_each = var.vnets
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    address_space = tolist(each.value.address_space)

}

resource "azurerm_subnet" "subnets" {
    for_each = var.subnets
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.virtual_network_name
    address_prefixes = tolist(each.value.address_prefixes)
  
}