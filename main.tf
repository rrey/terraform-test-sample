locals {
  

  ### map for environment code
  local l_environment_code {
    production    = "p"
    qualification = "q"
    development   = "d"
    pre-prod      = "r"
    integration   = "i"
    sandbox       = "s"
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
  l_cmdb_application_code    = lower(substr("TEST",1,4))

  ### variable environment from pipepline TF_VAR_environment external environment variable
  l_environment      = lower("${var.assie_environment}")

  ### variable security level from pipeline TF_VAR_securitylevel external environment variable
  l_securitylevel    = lower("{var.SecurityLevel}")

  ### calculate tag environment code 
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
    ApplicationName      = concat(local.l_cmdb_application_name,"-",local.l_environment_code)
    Branch               = ""
    Environment          = local.l_environment
    ApplicationLifetime  = ""
    MaintenanceWindow    = "Default value?"
    OpeningHours         = "Default value?"
    Exploitation         = ""
    SecurityLevel        = local.l_security_level_code
  }
  ### Calculate Resource group name base on HLD
  l_assie_rgname  = concat("az", "rg", "${local.l_environment_code}", "${local.l_cmdb_application_code}, "01")


}

### Generate Resource Group
resource "azurerm_resource_group" "assie_rg" {
  name     = "${local.l_assie_rgname}"
  location = "${var.module_location}"
  tags     = "${local.l_assie_tags}"
}
