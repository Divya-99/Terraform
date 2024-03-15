output "n01603642-vmlinux" {
  value = {
    ids       = values(azurerm_linux_virtual_machine.n01603642-vmlinux)[*].id
    hostnames = values(azurerm_linux_virtual_machine.n01603642-vmlinux)[*].name
    nic-ids   = values(azurerm_linux_virtual_machine.n01603642-vmlinux)[*].network_interface_ids[0]
  }
}

output "n01603642-vmlinux-fqdn" {
  value = values(azurerm_public_ip.n01603642-vmlinux-pip)[*].fqdn
}

output "n01603642-vmlinux-private-ip" {
  value = values(azurerm_linux_virtual_machine.n01603642-vmlinux)[*].private_ip_address
}

output "n01603642-vmlinux-public-ip" {
  value = values(azurerm_linux_virtual_machine.n01603642-vmlinux)[*].public_ip_address
}

output "n01603642-vmlinux-nic-ids" {
  value = [values(azurerm_network_interface.n01603642-vmlinux-nic)[*].id]
}

