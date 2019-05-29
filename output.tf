output "assieRgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.assie_rg.name}"
}

output "assieRgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.assie_rg.location}"
}

