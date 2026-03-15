//Create ResourceGroups
resource "azurerm_resource_group" "myrg" {
  count    = length(var.varvmrg)
  name     = "${var.varvmrg[count.index]}-${count.index + 1}"
  location = var.varlocation[count.index]

  tags = local.common_tags

}
