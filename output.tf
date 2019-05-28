output "rgName" {
  description = "The resource group name"
  value       = "${azurerm_resource_group.rg.name}"
}

output "rgLocation" {
  description = "The resource group location"
  value       = "${azurerm_resource_group.rg.location}"
}

## subscription
output "current_subscription_display_name" {
  value = "${data.azurerm_subscription.current_subscription.display_name}"
}

output "current_subscription_location_id" {
  value = "${data.azurerm_subscription.current_subscription.location_placement_id}"
}
location_placement_id