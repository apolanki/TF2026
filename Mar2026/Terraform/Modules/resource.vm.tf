resource "azurerm_network_interface" "main" {
  #count               = 2
  name                = "${var.varnic}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfiguration-${var.varvmname}"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"

  }
  depends_on = [azurerm_virtual_network.main, azurerm_subnet.main, azurerm_resource_group.main]

}

resource "azurerm_virtual_machine" "main" {
  #count                         = 2
  name                          = "${var.varvmname}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  resource_group_name           = azurerm_resource_group.main.name
  location                      = azurerm_resource_group.main.location
  vm_size                       = var.varvmsize
  network_interface_ids         = [azurerm_network_interface.main.id, ]
  delete_os_disk_on_termination = true

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }


  storage_os_disk {
    name              = "${var.varosdiskname}_${var.varvmname}_${random_string.resource_code.result}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    disk_size_gb      = var.vardisksize
    managed_disk_type = var.vardisktype
  }
  storage_image_reference {
    publisher = var.varpublisher
    offer     = "Windowsserver"
    sku       = var.varsku
    version   = "latest"

  }

  os_profile {
    admin_username = var.admin_username
    admin_password = var.admin_password
    computer_name  = var.varvmname


  }

  tags = var.tags

  depends_on = [azurerm_network_interface.main.id,]
}
