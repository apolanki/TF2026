variable "varlocation" {
  description = "The location to deploy resources"
  type        = list(string)
  default = ["centralus", "ukwest"]
}
variable "varvnet" {
  type        = list(string)
  default = ["vnet-centralus", "vnet-ukwest"]
}

variable "varaddresspace" {
  type        = list(string)
  default = ["10.51.0.0/18", "10.21.0.0/18"]

}

variable "varsnetaddressprefix" {
  type        = list(string)
  default = ["10.51.3.0/26", "10.21.1.0/26"]

}
variable "varsubnet" {
  //type        = list(string)
  default = "snet"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default = "azuser1"
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive = true
  default = "Azuser@1234"
}

//VM Variables


// Variables for Virtual Machine
variable "varvmrg" {
  type = list(string)
  default = ["rg-vms-centralus", "rg-vms-ukwest"]
}


variable "varvmname" {
  default = "vm-server"
}

variable "varvmsize" {
  default = "Standard_D2s_v3"
}

variable "varosdiskname" {
  default = "vm-server-01-os-disk-01"
}

variable "vardisksize" {
  default = "127"
}

variable "vardisktype" {
  default = "Standard_LRS"
}

variable "varpublisher" {
  default = "MicrosoftWindowsServer"
}

variable "varsku" {
  default = "2022-Datacenter"
}

variable "varvmuser" {
  default = "azuser1"
}

variable "varcomputername" {
  default = "myvm-srv1"
}


variable "varnic" {
  default = "nic_vms"
}
variable "varsubnetid" {
  default = "avxa"
}

variable "vrg1" {
    default = "rg-dev"
}

variable "varvnet1" {
  default = "vnet-uksouth-01"
}

# variable "tags" {
#   type        = map(string)
#   description = "Mandatory tags to provide to resources"
#   default     = {}
# }