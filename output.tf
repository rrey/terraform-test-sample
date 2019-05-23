output "rgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.rg.name}"
}

output "rgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.rg.location}"
}
