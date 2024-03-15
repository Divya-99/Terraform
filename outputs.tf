output "resource_group_name" {
  value = module.rgroup-n01603642.resource_group_name
}

output "virtual_network_name" {
  value = module.network-n01603642.virtual_network_name
}
output "subnet_name" {
  value = module.network-n01603642.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common-n01603642.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-n01603642.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common-n01603642.storage_account_name
}

output "loadbalancer" {
  value = module.loadbalancer-n01603642.n01603642-loadbalancer-name
}

output "loadbalancer-ip" {
  value = module.loadbalancer-n01603642.n01603642-loadbalancer-ip
}

output "database_instance_name" {
  value = module.database-n01603642.database_instance_name
}

output "vmwindows-hostname" {
  value = module.vmwindows-n01603642.windows
}

output "vmwindows-fqdn" {
  value = module.vmwindows-n01603642.windows_vm_fqdn
}

output "vmwindows-private-ip" {
  value = module.vmwindows-n01603642.windows_private_ip_address
}

output "vmwindows-public-ip" {
  value = module.vmwindows-n01603642.windows_public_ip_address
}

output "vmwindows-nic-ids" {
  value = module.vmwindows-n01603642.windows_nic_id
}
