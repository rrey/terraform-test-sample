locals {
  rgname = concat(aws_instance.blue.*.id, aws_instance.green.*.id)
}

locals {
  local_tags = {
    Service = local.service_name
    Owner   = local.owner
  }

resource "azurerm_resource_group" "assie_rg" {
  count    = "${data.external.test_resourcegroup.result.RgExists == "true" ? 0 : 1 }"

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