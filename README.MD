# List of tags

Tags will be used for Financial reporting and application lifecycle
For relation with other referential (CMDB), key value is Application name
All Tags are set to all resources ; some tags are also set at resource group level

Application name*        All environment     Key value between Azure and CMDB. Example SITERN-P with format (application name)-(environment code)
Branch*                  All environment     TOTAL Business Branch (MS EP RC GP HD TS)
Environment*             All environment     Single character (Prod Qual Dev pReprod Integration Sandbox)
Application Lifetime*    Only for Sandbox    End date (format)
Exploitation*            All environment     Name of outsourcer ("BOOST")
Security Level*          All environment     Standard, High, Conditional

* only for Resource Group

# Naming of Resource Group

Naming Syntax use the following rules :
    lower characters
    fixed size (no hyphen is used to separate significant strings)

Resource Group Name = 
    Cloud Prefix    2 char  az, as, gc
    Type            2 char  rg
    Environment     1 char  (p)rod, (q)ual, (d)ev, (p)reprod, (i)ntegration, (s)andbox
    Name            4 char  code of application
    Index           2 char  number

# Input variables (* = needed)

module_location {
    description = "Applicable to Azure MVP - ASSIE Project will follow the following rules - Azure Location is West Europe"
    type        = "string"
    default     = "westeurope"
}

assie_applicationName* {
    description = "Name of applicationr - from the environment variable TF_VAR_assie_applicationName"
    type        = "string"
    default     = ""
}

assie_environment* {
    description = "value pass from the environment variable TF_VAR_assie_environment"
    type        = "string"
    default     = ""
}

assie_branch* {
    description = "Name of branch - from the environment variable TF_VAR_assie_branch"
    type        = "string"
    default     = ""
}

assie_securityLevel {
    description = "value pass from the environment variable TF_VAR_assie_securitylevel"
    type        = "string"
    default     = "standard"
}

assie_exploitation {
    description = "Name of outsourcer - from the environment variable TF_VAR_assie_exploitation"
    type        = "string"
    default     = "BOOST"
}


# Calling the az_resource_group module

module "assie_rg" {
  source                = "git/az_resource_group"
  module_location       = your "${var.}"
# assie_environment     = from TF_VAR_assie_environment or your "${var.}
# assie_securityLevel   = from TF_VAR_assie_securitylevel or your "${var.}
# assie_exploitation    = from TF_VAR_assie_exploitation or your "${var.}
# assie_applicationName = from TF_VAR_assie_applicationName or your "${var.}
# assie_branch          = from TF_VAR_assie_branch or your "${var.}
}

# using the Output variables
= "${module.assie_rg.assieRgName.value}"
  description = "The resource group name"

= "${module.assie_rg.tagApplicationName.value}"
  description = "Application name as Assie naming convention"

= "${module.assie_rg.tagBranch.value}"
  description = "TOTAL Business Branch - MS, EP, RC, GP, HD or TS"

= "{module.assie_rg.tagEnvironment.value}"
  description = "Enviroment"

= "{module.assie_rg.tagApplicationLifetime.value}"
  description = "For sandbox"

= "{module.assie_rg.tagExploitation.value}"
  description = "Name of outsourcer"

= "{module.assie_rg.tagSecurityLevel.value}"
  description = "Security Level - Standard, High or Conditional"

# out of this module
Maintenance Window       All environment     Default value - VM can be stopped or started at any time - Other value for maintenance windows in hour per week
Opening Hours            All environment     Default value - VM must be up 24.24 Hours, 7.7 days
