variable module_location {
    description = "Applicable to Azure MVP - ASSIE Project will follow the following rules - Azure Location is West Europe"
    type        = "string"
    default     = "westeurope"
}

variable assie_applicationName {
    description = "Name of applicationr - from the environment variable TF_VAR_assie_applicationName"
    type        = "string"
    default     = ""
}

variable assie_branch {
    description = "Name of branch - from the environment variable TF_VAR_assie_branch"
    type        = "string"
    default     = ""
}

variable assie_environment {
    description = "value pass from the environment variable TF_VAR_assie_environment"
    type        = "string"
    default     = ""
}

variable assie_securityLevel {
    description = "value pass from the environment variable TF_VAR_assie_securityLevel"
    type        = "string"
    default     = "standard"
}

variable assie_exploitation {
    description = "Name of outsourcer - from the environment variable TF_VAR_assie_exploitation"
    type        = "string"
    default     = "BOOST"
}

