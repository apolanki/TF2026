//Create Virtual Networks
resource "azurerm_virtual_network" "main" {
  #count               = length(var.varvnet)
  name                = "${var.varvnet}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  address_space       = [var.varaddresspace]
  location            = var.varlocation
  resource_group_name = var.varvmrg
  tags                = var.tags
  #depends_on          = [azurerm_resource_group.main.name]

}

resource "azurerm_subnet" "main" {
 # count                = length(var.varsnetaddressprefix)
  name                 = "${var.varsubnet}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  resource_group_name  =  azurerm_virtual_network.main.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.varsnetaddressprefix]
  #depends_on           = [azurerm_resource_group.main.name]

}