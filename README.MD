# ***Create a Resource Group in Azure***
  

# Resource Group namming convention
Naming Syntax use the following rules :
- [x] Lower characters
- [x] Fixed size (*no hyphen is used to separate significant strings*)

## Resource Group Construction
Type | Char(s) length | Allowed values | Description
--- | --- | --- | --- 
`Cloud_Prefix` | *2 char* | [ az / as / gc ] | Allowed cloud prefix
`Type` | *2 char* | [ rg ] | Resource group = rg
`Environment` | *1 char* | [ p / q / d / r / i / s ] | (***p***)rod, (***q***)ual, (***d***)ev, p(***r***)eprod, (***i***)ntegration, (***s***)andbox 
`Name` | *x char & x int* | [ <App_name> ] | Application name without space
`Index` | *2 char* | [ 01 ] | Index number for resource group

Resource group construction is separated with two dash :  
>*[Cloud_Prefix][Type][Environment] **-** [Name] **-** [Index]*  

Example :   
> *azrgs-xx03-01*

## Tags list
Tags will be used for Financial reporting and application lifecycle
For relation with other referential (CMDB), key value is Application name
All Tags are set to all resources ; some tags are also set at resource group level

Tag name | Environment(s) | Description
--- | --- | --- 
`Application name` | *All environment* | Key value between Azure and CMDB.
`Branch` | *All environment* | TOTAL Business Branch ( MS / EP / RC / GP / HD / TS )
`Environment` | *All environment* | Single character (***P***)roduction / (***Q***)ualification / (***D***)evelopment / p(***R***)e-prod / (***I***)ntegration / (***S***)andbox
`Application Lifetime` | *Only for Sandbox* | End date (*format*)
`Exploitation` | *All environment* | Name of outsourcer (*"BOOST"*)
`Security Level` | *All environment* | Standard, High, Conditional

# Howto use resource group module

Module declaration :

```json
module "create_rg" {
    source                = "git::https://dev.azure.com/tgits-code/ASSIE%20AZURE/_git/az_resource_group?ref=master"
    module_create         = true
    assie_applicationCode = "${var.application_code}" 
    assie_environment     = "${var.environment}"
    assie_branch          = "${var.branch}"
}
```
## Mandatory Inputs
Input name   | Input type| Description 
----------- | ----------- | -----------
 `assie_applicationName` / or / `assie_applicationCode` | *string* | Application name from environment variable / or / *Application Code from environment variable*       
`assie_environment`  | *string* |  1 char - value pass from environment variable 
`assie_branch`  | *string* | Branch name - from environment variable      

## Optional Inputs

Input name   | Input type| Description 
----------- | ----------- | -----------
`assie_location`  | *string* |  Default region : *West Europe*
`assie_applicationDuration`  | *string* |  Default ApplicationDuration : *8760*
`assie_securityLevel`  | *string* | Default SecurityLevel : *standard* 
`assie_exploitation`  | *string* |  Name of outsourcer, default assie_exploitation : *BOOST*

# Using the Output variables

- `"${module.assie_rg.assieRgName.value}"` => The resource group name
- `"${module.assie_rg.tagApplicationName.value}"` => Application name as Assie naming convention
- `"${module.assie_rg.tagBranch.value}"` => TOTAL Business Branch - MS, EP, RC, GP, HD or TS
- `"${module.assie_rg.tagEnvironment.value}"` => Environment
- `"${module.assie_rg.tagApplicationLifetime.value}"` => For sandbox
- `"${module.assie_rg.tagExploitation.value}"` => Name of outsourcer
- `"${module.assie_rg.tagSecurityLevel.value}"` => Security Level - Standard, High or Conditional


   
   
# * * * ***TO_BE_DELETED*** * * * Calling the az_resource_group module
module "assie_rg" {
  source                = "git/az_resource_group:ref=dev"
  assie_environment     = from TF_VAR_assie_environment or your "${var.}
  assie_branch          = from TF_VAR_assie_branch or your "${var.}
  assie_applicationName = from TF_VAR_assie_applicationName or your "${var.}
or
  assie_applicationCode = from TF_VAR_assie_applicationCode or your "${var.}

  module_location     = your "${var.}" or default
  assie_exploitation  = from TF_VAR_assie_exploitation or your "${var.} or default
  assie_securityLevel = from TF_VAR_assie_securitylevel or your "${var.} or default
}
# * * * ***TO_BE_DELETED*** * * * 

