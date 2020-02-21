# Create a Resource Group in Azure
---------------------  

# Resource Group namming convention
Naming Syntax use the following rules :
- [x] Lower characters
- [x] Fixed size (*no hyphen is used to separate significant strings*)

## Resource Group Construction
Type | Char(s) length | Allowed values | Description
--- | --- | --- | --- 
`Cloud_Prefix` | *2 char* | [ az ] | Allowed cloud prefix / fixed with l_cloud_code in main.tf 
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
All Tags are set to all resources. Some tags are also set at resource group level

Tag name | Environment(s) | Description
--- | --- | --- 
`Application name` | *All environment* | Key value between Azure and CMDB.
`Branch` | *All environment* | TOTAL Business Branch ( MS / EP / RC / GP / HD / TS )
`Environment` | *All environment* | Single character (***P***)roduction / (***Q***)ualification / (***D***)evelopment / p(***R***)e-prod / (***I***)ntegration / (***S***)andbox
`Application Lifetime` | *Only for Sandbox environment* | End date of RG (*format*)
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
 `assie_applicationName` | *string* | ApplicationName from environment variable. */!\ Warning : If applicationName value is empty it will be replace by applicationCode value*      
 `assie_applicationCode` | *string* | Application code from environment variable. */!\ Warning : If applicationCode value is empty it will be replace by applicationName value*      
`assie_environment`  | *string* |  1 char - value pass from environment variable 
`assie_branch`  | *string* | Branch name - from environment variable      

## Optional Inputs

Input name   | Input type| Description 
----------- | ----------- | -----------
`assie_location`  | *string* |  Default region : *West Europe*
`assie_applicationDuration`  | *string* |  Default ApplicationDuration for SandBox : *8760*
`assie_securityLevel`  | *string* | Default SecurityLevel : *Standard* 
`assie_exploitation`  | *string* |  Name of outsourcer, default assie_exploitation : *BOOST*

# Using the Output variables

## General Output variables
`"${module.assie_rg.outputRgId.value}"` => Resource Group id  
`"${module.assie_rg.assieRgName.value}"` => Resource group name  
`"${module.assie_rg.outputRgLocation.value}"` => Resource group location

## Output tags variables
`"${module.assie_rg.tagApplicationName.value}"` => Application name as Assie naming convention  
`"${module.assie_rg.tagBranch.value}"` => TOTAL Business Branch - MS, EP, RC, GP, HD or TS  
`"${module.assie_rg.tagEnvironment.value}"` => Environment 
`"${module.assie_rg.tagApplicationLifetime.value}"` => Only with Sandbox (***s***) environment  
`"${module.assie_rg.tagExploitation.value}"` => Outsourcer  
`"${module.assie_rg.tagSecurityLevel.value}"` => Security Level tag - Standard, High or Conditional

# Additionnal documentations
No additional doc required