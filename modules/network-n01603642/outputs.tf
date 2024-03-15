output "virtual_network_name" {
  value = azurerm_virtual_network.n01603642-vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.n01603642-subnet.name
}

output "n01603642-vnet" {
  value = azurerm_virtual_network.n01603642-vnet.name
}

output "n01603642-subnet" {
  value = {
    id   = azurerm_subnet.n01603642-subnet.id
    name = azurerm_subnet.n01603642-subnet.name
  }
}