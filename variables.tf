variable client_location {}
variable client_rgName {}
#variable tagEnvironment {}

variable "client_tags" {
    description = "Tags will be used for Financial reporting and application lifecycle"
    type = "map"
    default = {
        "Application name"      = ""
        "Branch"                = ""
        "Environment"           = ""
        "Application Lifetime"  = ""
        "Maintenance Window"    = ""
        "Opening Hours"         = ""
        "Exploitation"          = ""
        "Security Level"        = ""
    }
}