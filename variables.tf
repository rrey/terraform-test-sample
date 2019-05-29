variable module_location {
    description = "Applicable to Azure MVP - ASSIE Project will follow the following rules - Azure Location is West Europe"
    type        = "string"
    default     = "westeurope"
}

variable assie_environment {
    description = "value pass from the environment variable TF_VAR_assie_environment"
    type        = "string"
    default     = "sandbox"
}

variable assie_securityLevel {
    description = "value pass from the environment variable TF_VAR_assie_securitylevel"
    type        = "string"
    default     = "standard"
}
