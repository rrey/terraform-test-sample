variable assie_location {
    description = "Applicable to Azure MVP - ASSIE Project will follow the following rules - Azure Location is West Europe"
    type        = "string"
    default     = "westeurope"
}

variable assie_tags {
    description = "Tags will be used for Financial reporting and application lifecycle"
    type = "map"
    default = {
        ApplicationName      = ""
        Branch               = ""
        Environment          = ""
        ApplicationLifetime  = ""
        MaintenanceWindow    = ""
        OpeningHours         = ""
        Exploitation         = ""
        SecurityLevel        = ""
    }
}

variable assie_environmentCode {
  type = "map"
  default = {
    prod     = "p"
    qual     = "q"
    dev      = "d"
    pre-prod = "r"
    int      = "i"
    sandbox  = "s"
  }

variable env_environment {
    description = "value pass from the environment variable TF_VAR_env_environment"
    type        = "string"
    default     = ""
}
variable client_rgName {}