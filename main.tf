# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "rg" {
  #count    = 0
  name     = "${var.client_rgName}"
  location = "${var.client_location}"

  tags {
    environment = "${var.tagEnvironment}"
  }
}