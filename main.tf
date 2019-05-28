locals {
  rgname = concat("az", "rg", var.assie_environmentCode["{local.actualEnvironment}"], local.totalCmdbCode)
}

locals {
  local_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

resource "azurerm_resource_group" "assie_rg" {

  name     = "${local.rgname}"
  location = "${var.assieLocation}"

  tags = local.common_tags
  
#  tags = {
#    environment = "${var.tagEnvironment}"
  }
}
