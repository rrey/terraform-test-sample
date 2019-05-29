locals {
  
  ### map for environment code
  local l_environment_code {
    pro = "p"
    qua = "q"
    dev = "d"
    pre = "r"
    int = "i"
    san = "s"
    }

  ### map for Total Branch
  l_branch {
    ms = "MS" 
    ep = "EP"
    rc = "RC" 
    gp = "GP" 
    hd = "HD" 
    ts = "TS"
  }

  ### map for Total SecurityLevel
  l_security_level {
    standard    = "Standard"
    high        = "High"
    conditional = "Conditional"
  }

  ### variable application code to determine from CMDB - TEST for testing
  l_cmdb_application_code = "TEST"

  ### variable environment from  TF_VAR_assie_environment
  l_environment = lower(substr("${var.assie_environment}",1,3))

  ### variable security level from TF_VAR_assie_securitylevel
  l_securitylevel = lower("{var.SecurityLevel}")

  ### variable exploitation from TF_VAR_assie_exploitation
  l_exploitation = lower("{var.assie_exploitation}") 

  ### Calculate tag environment code 
  l_environment_code = "${local.l_environment_code[local.l_environment]}"

  ### Calulate tag Application Name
  l_application_lifetime = "360000"

  ### Calculate tag Maintenance Window
  l_maintenance_windows = "UTC-0300-0430"

  ### Calculate tag Opening Hours
  l_opening_hours = "UTC-0800-1800"

  ### Calculate tag Security Level
  l_security_level_code = l.security_level[local.l_securitylevel]

  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName     = concat(local.l_application_name,"-",local.l_environment_code)
    Branch              = local.l_branch
    Environment         = local.l_environment
    ApplicationLifetime = local.l_application_lifetime
    MaintenanceWindow   = local.l_maintenance_windows
    OpeningHours        = local.l_opening_hours
    Exploitation        = local.l_exploitation
    SecurityLevel       = local.l_security_level_code
  }

  ### Calculate Resource group name base on HLD
  l_rgname  = concat("az", "rg", "${local.l_environment_code}", "${local.l_cmdb_application_code}, "01")

}

### Generate Resource Group
resource "azurerm_resource_group" "assie_rg" {
  location = "${var.module_location}"
  name     = local.l_rgname
  tags     = local.l_assie_tags
}
