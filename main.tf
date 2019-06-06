#### module Azurerm Resource Group
#### 20190530 - v0.1

### provider for generate code (not needed)
##  provider random {}

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

  ### map for Total Branch
  l_branch_map = {
    ms = "MS" 
    ep = "EP"
    rc = "RC" 
    gp = "GP"
    hd = "HD" 
    ts = "TS"
  }

  ### map for Total SecurityLevel
  l_security_level_map = {
    standard    = "Standard"
    high        = "High"
    conditional = "Conditional"
  }

  ### variable applicationName from TF_VAR_assie_applicationName
  l_application_name = trimspace(lower("${var.assie_applicationName}"))

  ### variable application code from CMDB
  l_cmdb_application_code = lower(substr(local.l_application_name,0,4))

  ### variable environment from  TF_VAR_assie_environment
  l_tag_environment = lower(substr("${var.assie_environment}",0,3))

  ### variable security level from TF_VAR_assie_securityLevel
  l_securitylevelvar = lower("${var.assie_securityLevel}")

  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_exploitation = lower("${var.assie_exploitation}") 

  ### Calculate tag exploitation from TF_VAR_assie_branch
  l_branchvar = lower(substr("${var.assie_branch}",0,2))

  ### Calculate tag Branch code
  l_tag_branch = local.l_branch_map[local.l_branchvar]

  ### Calculate tag Application Name
  ## Calculate environment Code
  l_environment_code = local.l_environment_map[local.l_tag_environment]

  # Calculate tag Application Name
  l_tag_application_name = "${local.l_application_name}-${local.l_environment_code}"

  ### Calulate tag Application Life Time (end date) - test 1 year
  ## timeadd(time, duration)
  ## Returns a UTC timestamp string corresponding to adding a given duration to time in RFC 3339 format.
  l_application_end_date = "1y"

  # Calculate tag Application LifeTime
  l_tag_application_lifetime = timeadd(timestamp(), local.l_application_end_date)

  ### Calculate tag exploitation from TF_VAR_assie_exploitation
  l_tag_exploitation = upper("${var.assie_exploitation}") 

  ### Calculate tag Security Level
  l_tag_security_level = local.l_security_level_map[local.l_securitylevelvar]

  ### tags for resource groupe base on HLD on SandBox
  l_assie_tag_sandbox = {
    ApplicationName     = local.l_tag_application_name
    Branch              = local.l_tag_branch
    Environment         = local.l_tag_environment
    ApplicationLifetime = local.l_tag_application_lifetime
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level
  }

  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName     = local.l_tag_application_name
    Branch              = local.l_tag_branch
    Environment         = local.l_tag_environment
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level
  }

  ### Calculate Resource Group Name base on HLD
  l_cloud_code     = "az"
  l_resource_code  = "rg"
  l_resource_index = "01"
  l_rgname = "${local.l_cloud_code}${local.l_resource_code}${local.l_environment_code}${local.l_cmdb_application_code}${local.l_resource_index}"
}

### Test if Resource Group exist
#data "external" "test_resourcegroup" {
#  program  = ["bash", "-c", "if [ -z \"$(az group exists -n \"${local.l_rgname}\")\" ]; then echo '{\"RgExists\": \"true\"}'; else echo '{\"RgExists\": \"false\"}'; fi"]
#}

### Generate Resource Group
resource "azurerm_resource_group" "assie_rg" {
#  count    = "${data.external.test_resourcegroup.result.RgExists == "true" ? 0 : 1 }"
  location = "${var.module_location}"
  name     = local.l_rgname
  tags     = local.l_environment_code == "s" ? local.l_assie_tag_sandbox : local.l_assie_tag
}
