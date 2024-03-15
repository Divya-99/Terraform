module "rgroup-n01603642" {
  source              = "./modules/rgroup-n01603642"
  resource_group_name = "n01603642-rg"
  location            = var.location

  common_tags = var.common_tags
}

module "network-n01603642" {
  source               = "./modules/network-n01603642"
  virtual_network_name = "n01603642-vnet"
  subnet_name          = "n01603642-subnet"
  resource_group_name  = module.rgroup-n01603642.resource_group_name
  location             = var.location

  common_tags = var.common_tags
}

module "common-n01603642" {
  source               = "./modules/common-n01603642"
  storage_account_name = var.storage_account_name
  resource_group_name  = module.rgroup-n01603642.resource_group_name
  location             = var.location

  common_tags = var.common_tags
}

module "vmlinux-n01603642" {
  source = "./modules/vmlinux-n01603642"

  instance_count      = 3
  location            = var.location
  resource_group_name = module.rgroup-n01603642.resource_group_name

  vmlinux-info = {
    name          = "n01603642-linux"
    computer_name = "n01603642-computer_name"
    size          = "Standard_B1s"

    storage_account_uri = module.common-n01603642.storage_account-primary_blob_endpoint

    admin_ssh_key = {
      admin_username = "n01603642"
      public_key     = "/Users/divya/.ssh/id_rsa.pub"
    }

    private_key = "/Users/divya/.ssh/id_rsa"

    os_disk = {
      storage_account_type = "Standard_LRS"
      disk_size_gb         = "32"
      caching              = "ReadWrite"
    }

    source_image_reference = {
      publisher = "OpenLogic"
      offer     = "CentOS"
      sku       = "8_2"
      version   = "latest"
    }
  }

  vmlinux-avs-info = {
    name                         = "linux-avs"
    platform_update_domain_count = "3"
    platform_fault_domain_count  = "2"
  }

  vmlinux-nic = {
    ip-configuration = {
      subnet_id                     = module.network-n01603642.n01603642-subnet.id
      private_ip_address_allocation = "Dynamic"
    }
  }

  vmlinux-pip = {
    allocation_method       = "Static"
    idle_timeout_in_minutes = "30"
  }

  vmlinux-network-watcher = {
    publisher                  = "Microsoft.Azure.NetworkWatcher"
    type                       = "NetworkWatcherAgentLinux"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = true

    settings = <<SETTINGS
        {}
    SETTINGS
  }

  vmlinux-network-monitor = {
    publisher                  = "Microsoft.Azure.Monitor"
    type                       = "AzureMonitorLinuxAgent"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = true

    settings = <<SETTINGS
      {}
  SETTINGS
  }

  common_tags = var.common_tags
}

module "datadisk-n01603642" {
  source = "./modules/datadisk-n01603642"
  
  resource_group_name = module.rgroup-n01603642.resource_group_name
  location = var.location

  linux_vm_ids        = module.vmlinux-n01603642.n01603642-vmlinux.ids 
  windows_vm_ids      = module.vmwindows-n01603642.windows.ids
  
  all_vm_ids = concat(module.vmlinux-n01603642.n01603642-vmlinux.ids, module.vmwindows-n01603642.windows.ids) 
  common_tags = var.common_tags
}

module "loadbalancer-n01603642" {
  source = "./modules/loadbalancer-n01603642"

  location            = var.location
  resource_group_name = module.rgroup-n01603642.resource_group_name

  loadbalancer-name = "n01603642-loadbalancer"
  allocation_method = "Static"

  loadbalancer-backend_pool_association = {
    count     = 3
    hostnames = module.vmlinux-n01603642.n01603642-vmlinux.hostnames
    nic-ids   = module.vmlinux-n01603642.n01603642-vmlinux.nic-ids
  }

  loadbalancer-rules = var.loadbalancer-rules

  common_tags = var.common_tags
}

module "database-n01603642" {
  source                       = "./modules/database-n01603642"
  humber_id                    = var.personal.n_number
  location                     = var.location
  resource_group_name          = module.rgroup-n01603642.resource_group_name
  sku_name                     = "GP_Gen5_2"
  postgresql_version           = "10"
  administrator_login_password = var.common_password

  common_tags = var.common_tags
}

module "vmwindows-n01603642" {
  source = "./modules/vmwindows-n01603642"
  
  resource_group_name = module.rgroup-n01603642.resource_group_name
  location = var.location
  
  subnet_id =  module.network-n01603642.n01603642-subnet.id
  storage_account_uri = module.common-n01603642.storage_account-primary_blob_endpoint
  
  common_tags = var.common_tags
}
