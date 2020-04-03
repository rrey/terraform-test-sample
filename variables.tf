
variable "location" {
  description = "The resource group location"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "The resource group name"
  type        = string
}

variable "rg_owner" {
  description = "The resource group owner"
  type        = string
}

variable "rg_tags" {
  description = "The resource group tags"
  type        = map
  default = {}
}
