#### module Azurerm Resource Group
#### 20190529 - v0.1

### provider for generate code
provider random {}

### local variables for HLD tags and assie resource group name format
locals {
  
  ### map for environment code
  local l_environment_map {
    pro = "p"
    qua = "q"
    dev = "d"
    pre = "r"
    int = "i"
    san = "s"
    }

  ### map for Total Branch
  l_branch_map {
    ms = "MS" 
    ep = "EP"
    rc = "RC" 
    gp = "GP"
    hd = "HD" 
    ts = "TS"
  }

  ### map for Total SecurityLevel
  l_security_level_map {
    standard    = "Standard"
    high        = "High"
    conditional = "Conditional"
  }

  ### variable applicationName from TF_VAR_assie_applicationName
  l_application_name = "${var.assie_applicationName}"

  ### variable environment from  TF_VAR_assie_environment
  l_tag_environment = lower(substr("${var.assie_environment}",1,3))

  ### variable security level from TF_VAR_assie_securitylevel
  l_securitylevel = lower("{var.SecurityLevel}")

  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_exploitation = lower("{var.assie_exploitation}") 

  ### variable application code from CMDB - 
  l_cmdb_application_code = lower(substr(l_application_name,1,4)

  ### Calculate tag Branch code
  l_tag_branch_code = "${local.l_branch_map[local.l_branch]}"

  ### Calculate tag Application Name
  ## Calculate environment Code
  l_environment_code = local.l_environment_map[local.l_tag_environment]
  ## variable applicationName from TF_VAR_assie_applicationName
  l_application_name = "${var.assie_applicationName}
  ## Calculate tag Application Name
  l_tag_application_name = "local.l_application_name-local.l_environment_code"

  ### Calulate tag Application Life Time (end date) - test 1 yeay
  ## timeadd(time, duration)
  ## Returns a UTC timestamp string corresponding to adding a given duration to time in RFC 3339 format. 
  l_application_end_date = "1y"
  l_tag_application_lifetime = timeadd(timestamp(), local.l_application_end_date)

  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_tag_exploitation = lower("{var.assie_exploitation}") 

  ### Calculate tag Security Level
  l_tag_security_level_code = local.l_security_level_map[local.l_securitylevel]

  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName     = local.l_tag_application_name
    Branch              = local.l_tag_branch_code
    Environment         = local.l_tag_environment
    ApplicationLifetime = local.l_tag_application_lifetime
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level_code
  }

  ### Calculate Resource group name base on HLD
  l_cloud_code     = "az"
  l_resource_code  = "rg"
  l_resource_index = "01"
  l_rgname   = "local.l_cloud_codelocal.l_resource_codelocal.l_environment_codelocal.l_cmdb_application_codelocal.l_resource_index"
}

### Generate Resource Group
resource "azurerm_resource_group" "assie_rg" {
  location = "${var.module_location}"
  name     = local.l_rgname
  tags     = local.l_assie_tags
}
