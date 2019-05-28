locals {
  l_environment = lower("{var.envEnironment}")
}

locals {
  l_rgname = concat("az", "rg", var.assie_environmentCode["{local.actualEnvironment}"], local.totalCmdbCode?)
}

locals {
  l_tag = {
    Environment = local.l_environment
  }

resource "azurerm_resource_group" "assie_rg" {

  name     = "${local.l_rgname}"
  location = "${var.assie_location}"

  tags     = "${local.l_tags}"
  
#  tags = {
#    ApplicationName = "${data.rg.tagApplication}"
  }
}
