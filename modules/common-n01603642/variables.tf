variable "common_tags" {
  type        = map(string)
  description = "This block is to define common tags"
}

variable "location" {
  description = "Region in which all resources must be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "storage_account_name" {
  type = string
}