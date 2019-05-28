locals {
  rgname = concat(var.assieCloudPrefix["{local.actualProvider}"], "rg", var.assie_environmùentCode["{local.actualEnvironment}"], local.totalCmdbCode)
}

locals {
  local_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

resource "azurerm_resource_group" "assie_rg" {

  name     = "${var.client_rgName}"
  location = "${var.client_location}"

  tags = local.common_tags
  
#  tags = {
#    environment = "${var.tagEnvironment}"
  }
}

tags {
        Name = "${var.role} ${var_env}"
        role = "${var.app_role}"
        ${var.app_role} = "${var_env}"
    }