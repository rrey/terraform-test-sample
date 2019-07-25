### Variable exist
variable "module_exist" {
    description = "Resource create or destroy"
    type        = bool
    default     = true
}

variable "assie_branch" {
    description = "Name of branch - from a variable or the environment variable TF_VAR_assie_branch"
    type        = string
    default     = ""
}

variable "assie_environment" {
    description = "value pass from a variable or the environment variable TF_VAR_assie_environment"
    type        = string
    default     = ""
}

variable "assie_location" {
    description = "Applicable to Azure MVP - ASSIE Project will follow the following rules - Azure Location is West Europe"
    type        = string
    default     = "westeurope"
}

variable "assie_applicationName" {
    description = "Name of application - from a variable or the environment variable TF_VAR_assie_applicationName"
    type        = string
    default     = "null"
}

variable "assie_applicationCode" { 
    description = " Code of application - from a variable or the environment variable TF_VAR_assie_applicationCode"
    default = "null"
}

variable "assie_securityLevel" {
    description = "value pass from a variable or the environment variable TF_VAR_assie_securityLevel"
    type        = string
    default     = "standard"
}

variable "assie_exploitation" {
    description = "Name of outsourcer - from a variable or the environment variable TF_VAR_assie_exploitation"
    type        = string
    default     = "BOOST"
}

variable "assie_applicationDuration" {
    description = "Application Life Time in Hours"
    type        = string
    default     = "8760"
}