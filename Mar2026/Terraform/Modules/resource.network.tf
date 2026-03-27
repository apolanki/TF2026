//Create Virtual Networks
resource "azurerm_virtual_network" "myvnet1" {
  #count               = length(var.varvnet)
  name                = "${var.varvnet}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  address_space       = [var.varaddresspace]
  location            = var.varlocation
  resource_group_name = var.varvmrg
  tags                = var.tags
  depends_on          = [var.varvmrg]

}

resource "azurerm_subnet" "myvnet1-snet1" {
 # count                = length(var.varsnetaddressprefix)
  name                 = "${var.varsubnet}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  resource_group_name  =  azurerm_virtual_network.myvnet1.resource_group_name
  virtual_network_name = azurerm_virtual_network.myvnet1.name
  address_prefixes     = [var.varsnetaddressprefix]
  depends_on           = [var.varvmrg]

}