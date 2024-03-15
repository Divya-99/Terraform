variable "common_tags" {
  type        = map(string)
  description = "This block is to define common tags"
}

variable "location" {
  description = "Resources should be created in this region"
  type        = string
  default     = "Australia Central"
}

# This
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01603642-rg"
}
