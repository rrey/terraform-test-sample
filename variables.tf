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
        Environment          = "sandbox"
        ApplicationLifetime  = ""
        MaintenanceWindow    = "Default value?"
        OpeningHours         = "Default value?"
        Exploitation         = ""
        SecurityLevel        = ""
    }
}

variable assie_environmentCode {
    description = "Assie environment code digit"
    type = "map"
    default = {
        production    = "p"
        qualification = "q"
        development   = "d"
        pre-prod      = "r"
        integration   = "i"
        sandbox       = "s"
  }

variable assie_subsciption_environment {
    description = "Assie Subscription Name Environment"
    type = "map"
        prod = "production"
        qual = "qualification"
        dev  = "development"
        hp   = "pre-prod"
        int  = "integration"
        sb   = "andbox"
}

variable env_environment {
    description = "value pass from the environment variable TF_VAR_env_environment"
    type        = "string"
    default     = "sandbox"
}
