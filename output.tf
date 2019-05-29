output "assieRgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.assie_rg.name}"
}

output "assieRgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.assie_rg.location}"
}

output "tagApplicationName" {
  description =
  
}
output "tagBranch" {}
output "tagEnvironment" {}
output "tagApplicationLifetime" {}
output "tagExploitation" {}
output "tagSecurityLevel" {}

    ApplicationName     = local.l_tag_application_name
    Branch              = local.l_tag_branch_code
    Environment         = local.l_tag_environment
    ApplicationLifetime = local.l_tag_application_lifetime
    Exploitation        = local.l_tag_exploitation
    SecurityLevel       = local.l_tag_security_level_code