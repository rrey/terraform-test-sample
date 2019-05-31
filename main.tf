#### module Azurerm Resource Group
#### 20190529 - v0.1

### provider for generate code
provider random {}

### local variables for HLD tags and assie resource group name format
locals {
  ### map for environment code
  l_environment_map = {
    pro = "p"
    qua = "q"
    dev = "d"
    pre = "r"
    int = "i"
    san = "s"
    }
}

locals {
  ### map for Total Branch
  l_branch_map = {
    ms = "MS" 
    ep = "EP"
    rc = "RC" 
    gp = "GP"
    hd = "HD" 
    ts = "TS"
  }
}

locals {
  ### map for Total SecurityLevel
  l_security_level_map = {
    standard    = "Standard"
    high        = "High"
    conditional = "Conditional"
  }
}

locals {
  ### variable applicationName from TF_VAR_assie_applicationName
  l_application_name = trimspace(lower("${var.assie_applicationName}"))
}

locals {
  ### variable application code from CMDB
  l_cmdb_application_code = lower(substr(local.l_application_name,1,4))
}

locals {
  ### variable environment from  TF_VAR_assie_environment
  l_tag_environment = lower(substr("${var.assie_environment}",1,3))
}

locals {
  ### variable security level from TF_VAR_assie_securityLevel
  l_securitylevelvar = lower("${var.assie_securityLevel}")
}

locals {
  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_exploitation = lower("${var.assie_exploitation}") 
}

locals {
  ### Calculate tag exploitation from TF_VAR_assie_branch
  l_branchvar = lower(substr("${var.assie_branch}",1,2))
}

locals {
  ### Calculate tag Branch code
  l_tag_branch = local.l_branch_map[local.l_branchvar]
}

locals {
  ### Calculate tag Application Name
  ## Calculate environment Code
  l_environment_code = local.l_environment_map[local.l_tag_environment]
}
locals {
  # Calculate tag Application Name
  l_tag_application_name = "$(local.l_application_name)-$(local.l_environment_code)"
}

locals {
  ### Calulate tag Application Life Time (end date) - test 1 year
  ## timeadd(time, duration)
  ## Returns a UTC timestamp string corresponding to adding a given duration to time in RFC 3339 format.
  l_application_end_date = "1y"
}
locals {
  # Calculate tag Application LifeTime
  l_tag_application_lifetime = timeadd(timestamp(), local.l_application_end_date)
}

locals {
  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_tag_exploitation = lower("${var.assie_exploitation}") 
}

locals {
  ### Calculate tag Security Level
  l_tag_security_level = local.l_security_level_map[local.l_securitylevelvar]
}

locals {
  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName     = local.l_tag_application_name
    Branch              = local.l_tag_branch
    Environment         = local.l_tag_environment
    ApplicationLifetime = local.l_tag_application_lifetime
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level
  }
}

locals {
  ### Calculate Resource Group Name base on HLD
  l_cloud_code     = "az"
}
locals {
  l_resource_code  = "rg"
}
locals {
  l_resource_index = "01"
}
locals {
  l_rgname = "$(local.l_cloud_code)$(local.l_resource_code)$(local.l_environment_code)$(local.l_cmdb_application_code)$(local.l_resource_index)"
}

### Generate Resource Group
resource "azurerm_resource_group" "assie_rg" {
  location = "${var.module_location}"
  name     = local.l_rgname
  tags     = local.l_assie_tag
}
