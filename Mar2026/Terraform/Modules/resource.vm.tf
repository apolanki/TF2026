resource "azurerm_network_interface" "mynic" {
  count = 2
  name = "nic-${var.varvmname}-${count.index+1}"
  location = azurerm_resource_group.myrg[count.index].location
  resource_group_name = azurerm_resource_group.myrg[count.index].name

  ip_configuration {
    name = "ipconfiguration-${var.varvmname}"
    subnet_id = azurerm_subnet.myvnet1-snet1[count.index].id
    private_ip_address_allocation = "Dynamic"

  }
depends_on = [ azurerm_virtual_network.myvnet1, azurerm_subnet.myvnet1-snet1, azurerm_resource_group.myrg ]

}

resource "azurerm_virtual_machine" "myvm" {
  count = 2
  name = "${var.varvmname}-${count.index+1}"
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location = azurerm_resource_group.myrg[count.index].location
  vm_size = var.varvmsize
  network_interface_ids = [azurerm_network_interface.mynic[count.index].id,]
  delete_os_disk_on_termination = true

os_profile_windows_config {
  provision_vm_agent = true
  enable_automatic_upgrades = true
}


  storage_os_disk {
    name = "os-disk-01-${var.varvmname}"
    create_option = "FromImage"
    caching = "ReadWrite"
    disk_size_gb = var.vardisksize
    managed_disk_type = var.vardisktype
  }
  storage_image_reference {
    publisher = var.varpublisher
    offer = "Windowsserver"
    sku = var.varsku
    version = "latest"
    
  }
  
  os_profile {
    admin_username = var.admin_username
    admin_password = var.admin_password
    computer_name = "myvm-srv01"


  }

 tags = local.common_tags

  //depends_on = [ azurerm_network_interface.mynic ]
  depends_on = [ var.varnic ]
}
