variable "varlocation" {
  description = "The location to deploy resources"
  type = string
  #type        = list(string)
  #default     = ["centralus", "ukwest"]
}
variable "varvnet" {
  description = "The name of the virtual network to create"
  type = string
  # type    = list(string)
  # default = ["vnet-centralus", "vnet-ukwest"]
}

variable "varaddresspace" {
  description = "The address space for the virtual network"
  type    = string

  #default = ["10.51.0.0/18", "10.21.0.0/18"]

}

variable "varsnetaddressprefix" {
  description = "The address prefix for the subnet"
  type    = string
  #type    = list(string)
  #default = ["10.51.3.0/26", "10.21.1.0/26"]

}
variable "varsubnet" {
  description = "The name of the subnet to create"
  type    = string
  //type        = list(string)
  #default = "snet"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "azuser1"
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive   = true
  default     = "Azuser@1234"
}

//VM Variables


// Variables for Virtual Machine
variable "varvmrg" {
  description = "The name of the resource group to create for the VM"
  type    = string
  # 
  # type    = list(string)
  # default = ["rg-vms-centralus", "rg-vms-ukwest"]
}


variable "varvmname" {
  description = "The name of the virtual machine to create"
  type    = string
  #type        = list(string)
  #default = module.naming_virtual_machine.result
}

variable "varvmsize" {
  description = "The size of the virtual machine to create"
  type    = string
  #default = "Standard_D2s_v3"
}

variable "varosdiskname" {
  description = "The name of the OS disk to create for the VM"
  type    = string
  
  #default = "vm-server-01-os-disk-01"
}

variable "vardisksize" {
  default = "127"
}

variable "vardisktype" {
  description = "The type of the disk to create for the VM"
  type    = string
  #default = "Standard_LRS"
}

variable "varpublisher" {
  description = "The publisher of the VM image"
  type    = string
  #default = "MicrosoftWindowsServer"
}

variable "varsku" {
  description = "The SKU of the VM image"
  type    = string
  #default = "2022-Datacenter"
}

variable "varvmuser" {
  description = "The username for the VM"
  type    = string
  default = "azuser1"
}

variable "varcomputername" {
  description = "The name of the computer"
  type    = string
  #default = "myvm-srv1"
}


variable "varnic" {
  description = "The name of the network interface to create"
  type    = string
  #default = "nic_vms"
}
variable "varsubnetid" {
  description = "The ID of the subnet to associate with the VM"
  type    = string
  default = "avxa"
}

variable "vrg1" {
  default = "rg-dev"
}

variable "varvnet1" {
  default = "vnet-uksouth-01"
}

variable "tags" {
  type        = map(string)
  description = "Mandatory tags to provide to resources"
  default     = {}
}

variable "varenvironment" {
  description = "The environment to deploy resources"
  type        = string
    
}

variable "varnamingsuffix" {
  description = "The suffix to add to resource names"
  type        = string
}