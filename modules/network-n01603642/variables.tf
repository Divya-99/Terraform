variable "common_tags" {
  type        = map(string)
  description = "This block is to define common tags"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Region of resource creation"
  type        = string
}


variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "n01603642-vnet"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "n01603642-subnet"
}