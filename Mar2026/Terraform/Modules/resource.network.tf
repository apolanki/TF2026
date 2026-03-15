//Create Virtual Networks
resource "azurerm_virtual_network" "myvnet1" {
  count = length(var.varvnet)
  name = var.varvnet[count.index]
  address_space = [var.varaddresspace[count.index]]
  location = var.varlocation[count.index]
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  tags = local.common_tags
  depends_on = [ var.varvmrg ]
  
}

resource "azurerm_subnet" "myvnet1-snet1" {
 count = length(var.varsnetaddressprefix)
  name = "snet-${var.varvnet[count.index]}-${count.index+1}"
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  virtual_network_name = azurerm_virtual_network.myvnet1[count.index].name
  address_prefixes = [var.varsnetaddressprefix[count.index]]
  depends_on = [ var.varvmrg ]
  
}