output "assieRgName" {
  description = "The resource group name"
#  value       = "${azurerm_resource_group.assie_rg[0].name}"
  value       = "${azurerm_resource_group.assie_rg.name}"
}

output "assieRgLocation" {
  description = "The resource group location"
#  value       = "${azurerm_resource_group.assie_rg[0].location}"
  value       = "${azurerm_resource_group.assie_rg.location}"
}

output "tagApplicationName" {
  description = "Application name as Assie naming convention"
  value       = local.l_tag_application_name
}

output "tagBranch" {
  description = "Total Branch"
  value       = local.l_tag_branch
}

output "tagEnvironment" {
  description = "Enviroment"
  value       = local.l_tag_environment
}

output "tagApplicationLifetime" {
  description = "For sandbox"
  value       = local.l_tag_application_lifetime
}

output "tagExploitation" {
  description = "Exploitation"
  value       = local.l_tag_exploitation
}

output "tagSecurityLevel" {
  description = "Security Level"
  value       = local.l_tag_security_level
}
