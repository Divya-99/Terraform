output "n01603642-loadbalancer-name" {
  value = azurerm_lb.n01603642-loadbalancer.name
}

output "n01603642-loadbalancer-ip" {
  value = azurerm_public_ip.n01603642-loadbalancer-pip.ip_address
}