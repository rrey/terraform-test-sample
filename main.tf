locals {
  actualEnvironment = lower("{var.envEnironment}")
}

locals {
  rgname = concat("az", "rg", var.assie_environmentCode["{local.actualEnvironment}"], local.totalCmdbCode)
}

locals {
  local_tags = {
    Environment = local.actualEnvironment
  }

resource "azurerm_resource_group" "assie_rg" {

  name     = "${local.rgname}"
  location = "${var.assie_location}"

  tags     = "${local.common_tags}"
  
#  tags = {
#    environment = "${var.tagEnvironment}"
  }
}
