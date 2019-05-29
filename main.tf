locals {
  l_total_cmdb_code    = lower(substr("TEST",1,4))
  l_environment      = lower("${var.assie_environment}")
  l_environment_code = "${var.assie_environmentCode["${local.l_environment}"]}"
  l_tag = {
    ApplicationName      = concat("${local.l_total_cmdb_code},"-","${local.l_environment})
    Branch               = ""
    Environment          = local.l_environment
    ApplicationLifetime  = ""
    MaintenanceWindow    = "Default value?"
    OpeningHours         = "Default value?"
    Exploitation         = ""
    SecurityLevel        = ""
  }
  l_assie_rgname  = concat("az", "rg", var.assie_environmentCode["${local.l_environment}"], local.l_totalCmdbCode, "01")
}

locals {

}



resource "azurerm_resource_group" "assie_rg" {

  name     = "${local.l_assie_rgname}"
  location = "${var.module_location}"

  tags     = "${local.l_tags}"
  
#  tags = {
#    ApplicationName = "${data.rg.tagApplication}"
  }
}
