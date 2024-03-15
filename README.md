Develop a Child Module for Resource Group:
Develop a Terraform child module called rgroup-HumberID to provision 1 resource group called HumberID-RG. This module should return the name of the resource group to the root module.

Develop a Child Module for Networking:
Develop a Terraform child module called network-HumberID to provision 1 virtual network calledHumberID-VNET along with 1 subnet called HumberID-SUBNET in HumberID-RG resource group. Add anetwork security group with 4 inbound access rules to allow traffic over ports 22, 3389, 5985, and 80. Thisnetwork security group must be associated with the subnet. This module should return the names of the virtualnetwork and the subnet to the root module.

Develop a Child Module for Common Services:
Develop a Terraform child module called common-HumberID to provision 1 log analytics workspace, 1recovery services vault, and 1 standard storage account with LRS redundancy. This storage account MUST bedifferent from the one with Terraform backend located. This module should return the names of the threeresources to the root module.

Develop a Child Module for Linux Virtual Machines:
Develop a Terraform child module called vmlinux-HumberID to provision 3 CentOS 8.2 Linux VMs withpublic IP addresses created in 1 availability set (use for_each to ensure the code is scalable). Each VM must usethe storage account created above for VM boot diagnostics. Each VM must have a unique DNS label assigned.The VMs must have 2 extensions installed: (1) Network Watcher extension [publisher:Microsoft.Azure.NetworkWatcher; name: NetworkWatcherAgentLinux; version 1.0] and (2) Azure Monitorextension [publisher: Microsoft.Azure.Monitor; name: AzureMonitorLinuxAgent; version 1.0]. Use the remote-exec null provisioner to display the hostnames of all 3 VMs. This module must return the hostnames, domainnames, private IP addresses, and public IP addresses of the VMs to the root module.

Develop a Child Module for Windows Virtual Machines:
Develop a Terraform child module called vmwindows-HumberID to provision 1 Windows Server 2016 VMwith public IP address created in 1 availability set (use count to ensure the code is scalable). The VM must haveAntimalware extension installed. The VM must use the storage account created above for VM boot diagnostics.The VM must have a unique DNS label assigned. This module must return the hostname, domain name, privateIP address, and public IP address of the VM to the root module.

Develop a Child Module for Data Disks:
Develop a Terraform child module called datadisk-HumberID to provision 4 x 10GB disks and attach them tothe 4 VMs.

Develop a Child Module for Load Balancer:
Develop a Terraform child module called loadbalancer-HumberID to provision 1 public-facing basic loadbalancer with all 3 Linux VMs behind it. This module should return the name of the load balancer to the rootmodule.

Develop a Child Module for Database:
Develop a Terraform child module called database-HumberID to provision 1 Azure DB for PostgreSQL SingleServer instance. This module should return the name of the DB instance to the root module.

Develop the Root Module:
Develop a Terraform root module called assignment1-HumberID and define all child modules in it. Thismodule should print on the screen the outputs received from child modules on a successful deployment