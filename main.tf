
resource "azurerm_resource_group" "some_rg" {
  location = var.location
  name     = var.rg_name
  tags     = merge({owner = var.rg_owner}, var.rg_tags)
}
