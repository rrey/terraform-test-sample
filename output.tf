output "assieRgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.assie_rg.name}"
}

output "assieRgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.assie_rg.location}"
}

output "tagApplicationName" {
  description = ""
  value       = local.l_tag_application_name
}

output "tagBranch" {
  description = ""
  value       = local.l_tag_branch_code
}

output "tagEnvironment" {
  description = ""
  value       = local.l_tag_environment
}

output "tagApplicationLifetime" {
  description = ""
  value       = local.l_tag_application_lifetime
}

output "tagExploitation" {
  description = ""
  value       = local.l_tag_exploitation
}

output "tagSecurityLevel" {
  description = ""
  value       = local.l_tag_security_level_code
}
