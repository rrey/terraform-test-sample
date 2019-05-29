locals {
  l_environment   = lower("${var.assie_environment}")
  l_totalCmdbCode = lower(substr("TEST",1,4))
  l_assie_rgname        = concat("az", "rg", var.assie_environmentCode["${local.actualEnvironment}"], local.l_totalCmdbCode, "01")
}

locals {
  l_tag = {
    ApplicationName      = ""
    Branch               = ""
    Environment          = local.l_environment
    ApplicationLifetime  = ""
    MaintenanceWindow    = "Default value?"
    OpeningHours         = "Default value?"
    Exploitation         = ""
    SecurityLevel        = ""
    }
}

resource "azurerm_resource_group" "assie_rg" {

  name     = "${local.l_assie_rgname}"
  location = "${var.module_location}"

  tags     = "${local.l_tags}"
  
#  tags = {
#    ApplicationName = "${data.rg.tagApplication}"
  }
}
