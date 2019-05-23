# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "rg" {
  count    = "${data.external.test_resourcegroup.result.RgExists == "true" ? 0 : 1 }"

  name     = "${var.client_rgName}"
  location = "${var.client_location}"

  tags {
    environment = "${var.tagEnvironment}"
  }
}