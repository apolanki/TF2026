//Create ResourceGroups
resource "azurerm_resource_group" "myrg" {
  #count    = length(var.varvmrg)
  #name     = "${var.varvmrg[count.index]}-${count.index + 1}"
  name = var.varvmrg

  location = var.varlocation

  tags = var.tags

}
