locals {
  l_subscription_name = "${data.azurerm_subscription.current_subscription.subscription_name}"
}

locals {
  l_environment = lower("{var.envEnironment}")
}

locals {
  l_rgname = concat("az", "rg", var.assie_environmentCode["{local.actualEnvironment}"], local.totalCmdbCode?)
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

  name     = "${local.l_rgname}"
  location = "${var.module_location}"

  tags     = "${local.l_tags}"
  
#  tags = {
#    ApplicationName = "${data.rg.tagApplication}"
  }
}
