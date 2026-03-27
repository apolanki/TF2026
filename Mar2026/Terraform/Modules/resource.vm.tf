resource "azurerm_network_interface" "mynic" {
  #count               = 2
  name                = "${var.varnic}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "ipconfiguration-${var.varvmname}"
    subnet_id                     = azurerm_subnet.myvnet1-snet1.id
    private_ip_address_allocation = "Dynamic"

  }
  depends_on = [azurerm_virtual_network.myvnet1, azurerm_subnet.myvnet1-snet1, azurerm_resource_group.myrg]

}

resource "azurerm_virtual_machine" "myvm" {
  #count                         = 2
  name                          = "${var.varvmname}${var.varenvironment}${var.varnamingsuffix}${random_string.resource_code.result}"
  resource_group_name           = azurerm_resource_group.myrg.name
  location                      = azurerm_resource_group.myrg.location
  vm_size                       = var.varvmsize
  network_interface_ids         = [azurerm_network_interface.mynic.id, ]
  delete_os_disk_on_termination = true

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }


  storage_os_disk {
    name              = "${var.varosdiskname}-${azurerm_virtual_machine.myvm.name}"
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

  //depends_on = [ azurerm_network_interface.mynic ]
  depends_on = [var.varnic]
}
