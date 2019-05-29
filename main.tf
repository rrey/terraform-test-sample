locals {
  ### Cmdb code to determine - TEST for testing
  l_cmdb_application_code    = lower(substr("TEST",1,4))

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
    
  }

  ### variable environment from pipepline TF_VAR_environment external variable
  l_environment      = lower("${var.assie_environment}")

  ### calculate environment variable
  l_environment_code = "${var.assie_environmentCode["${local.l_environment}"]}"

  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName      = concat("${local.l_cmdb_application_code},"-","${local.l_environment_code})
    Branch               = ""
    Environment          = local.l_environment
    ApplicationLifetime  = ""
    MaintenanceWindow    = "Default value?"
    OpeningHours         = "Default value?"
    Exploitation         = ""
    SecurityLevel        = ""
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
