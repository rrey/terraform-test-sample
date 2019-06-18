#### module Azurerm Resource Group
#### DLR - 20190530 - v0.1

locals {

  ### map for environment Name
  l_environment_map = {
    p = "p"
    q = "q"
    d = "d"
    r = "r"
    i = "i"
    s = "s"
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

  ### variable Environment
  # Calculate environment Code
  l_environment_code = lower(substr("${var.assie_environment}",0,1))
  # Test Environment Code
  l_tag_environment = lookup(local.l_environment_map, local.l_environment_code, "false")

  ### variable application Name
  l_application_name = "${var.assie_applicationName}" == "null" ? lower(substr(var.assie_applicationCode,0,4)) : replace(trimspace(lower("${var.assie_applicationName}"))," ","")

  ### variable application Code
  l_tag_application_code = "${var.assie_applicationCode}" == "null" ? lower(substr(local.l_application_name,0,4)) : lower(substr(var.assie_applicationCode,0,4))

  ### Calculate tag Exploitation
  l_exploitation = lower("${var.assie_exploitation}") 

  ### Calculate tag Branch code
  l_tag_branch = local.l_branch_map[lower(substr("${var.assie_branch}",0,2))]

  ### Calculate tag Application Name
  l_tag_application_name = "${local.l_application_name}-${local.l_environment_code}"

  ### Calulate tag Application Life Time
  l_application_duration     = "${var.assie_applicationDuration}h"
  l_tag_application_lifetime = timeadd(timestamp(), local.l_application_duration)

  ### Calculate tag Exploitation from TF_VAR_assie_exploitation
  l_tag_exploitation = upper("${var.assie_exploitation}") 

  ### Calculate tag Security Level
  l_securitylevelvar   = lower("${var.assie_securityLevel}")
  l_tag_security_level = local.l_security_level_map[local.l_securitylevelvar]

  ### tags for resource groupe base on HLD on SandBox
  l_assie_tag_sandbox = {
    ApplicationName     = local.l_tag_application_name
    ApplicationCode     = local.l_tag_application_code
    Branch              = local.l_tag_branch
    Environment         = local.l_tag_environment
    ApplicationLifetime = local.l_tag_application_lifetime
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level
  }

  ### tags for resource groupe base on HLD
  l_assie_tag = {
    ApplicationName     = local.l_tag_application_name
    ApplicationCode     = local.l_tag_application_code
    Branch              = local.l_tag_branch
    Environment         = local.l_tag_environment
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level
  }

  ### Calculate Resource Group Name base on HLD
  l_cloud_code     = "az"
  l_resource_code  = "rg"
  l_resource_index = "01"
  l_rgname = "${local.l_cloud_code}${local.l_resource_code}${local.l_environment_code}-${local.l_application_name}-${local.l_resource_index}"
}

### Test if Resource Group exist
#data "external" "test_resourcegroup" {
#  program  = ["bash", "-c", "if [ -z \"$(az group exists -n \"${local.l_rgname}\")\" ]; then echo '{\"RgExists\": \"true\"}'; else echo '{\"RgExists\": \"false\"}'; fi"]
#}

### Generate Resource Group
resource "azurerm_resource_group" "assie_resource_group" {
  count    = "${local.l_tag_environment == "false" ? 0 : 1 }"
  location = "${var.module_location}"
  name     = local.l_rgname
  tags     = local.l_environment_code == "s" ? local.l_assie_tag_sandbox : local.l_assie_tag
}
