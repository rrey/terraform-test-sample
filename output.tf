output "outputRgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.assie_resource_group[0].name}"
}

output "outputRgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.assie_resource_group[0].location}"
}

output "outputRgTags" {
  description = "all tags"
  value       = local.l_assie_tag
}

output "tagApplicationName" {
  description = "Application name as Assie naming convention"
  value       = local.l_tag_application_name
}

output "tagApplicationCode" {
  description = "Application code as Assie naming convention"
  value       = local.l_tag_application_code
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
