module "deploy_infra" {
  source = "../../Modules"

  varaddresspace       = "10.51.0.0/18"
  varcomputername      = "sales"
  vardisktype          = "Standard_LRS"
  varlocation          = "centralus"
  varnic               = "nic"
  varosdiskname        = "os-disk"
  varpublisher         = "MicrosoftWindowsServer"
  varsku               = "2022-Datacenter"
  varsnetaddressprefix = "10.51.3.0/26"
  varsubnet            = "snet1"
  varvmname            = "salesvm"
  varvmrg              = "rg_sales"
  varvmsize            = "Standard_D2s_v3"
  varvnet              = "vnet1"
  varenvironment       = "dev"
  varnamingsuffix      = "polanki"

  tags = {
    ApplicationName            = "tfdemo"
    DepartmentCode             = "dtd"
    BillingOwnerEmail          = "polankiaz501@outlook.com"
    Environment                = "dev"
    TechnicalAccountOwnerEmail = "polankiaz501@outlook.com"
  }



}

