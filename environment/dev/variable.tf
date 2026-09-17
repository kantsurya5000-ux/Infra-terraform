variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}


variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}


variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}


variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    subnet_key                    = string
    private_ip_address_allocation = string
  }))
}


variable "pip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}


variable "vms" {
  type = map(object({
    name            = string
    location        = string
    resource_group_name = string
    size            = string
    admin_username  = string
    admin_password  = string
  }))
}


variable "security_rules" {
  type = map(object({
    name      = string
    priority  = number
    direction = string
    access    = string
    protocol  = string
  }))
}


variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}


variable "nsga" {
  type = map(any)
}