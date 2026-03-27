module "deploy_infra" {
  source = "../../Modules"

  varaddresspace       = "10.21.0.0/18"
  varcomputername      = "sales"
  vardisktype          = "Standard_LRS"
  varlocation          = "ukwest"
  varnic               = "nic"
  varosdiskname        = "os-disk"
  varpublisher         = "MicrosoftWindowsServer"
  varsku               = "2022-Datacenter"
  varsnetaddressprefix = "10.21.1.0/26"
  varsubnet            = "snet2"
  varvmname            = "salesvm"
  varvmrg              = "rg_sales_prod"
  varvmsize            = "Standard_D2s_v3"
  varvnet              = "prodvnet1"
  varenvironment       = "prod"
  varnamingsuffix      = "polanki"

  tags = {
    ApplicationName            = "tfdemo"
    DepartmentCode             = "dtd"
    BillingOwnerEmail          = "polankiaz501@outlook.com"
    Environment                = "prod"
    TechnicalAccountOwnerEmail = "polankiaz501@outlook.com"
  }



}

