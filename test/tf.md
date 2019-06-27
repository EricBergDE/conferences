
 - version: 3
 - terraform_version: 0.11.11
 - serial: 9
 - lineage: 13bab335-e085-f5fb-8fbc-f81cdaf3519f
 - modules
    
     - 0
        
         - path
            
             - 0: root
            
         - outputs
            
            
         - resources
            
             - azurerm_network_interface.TF-DOKU-NIC
                
                 - type: azurerm_network_interface
                 - depends_on
                    
                     - 0: azurerm_public_ip.TF-DOKU-PIP
                     - 1: azurerm_resource_group.RG-TF-DOKU
                     - 2: azurerm_subnet.VNET-TF-DOKUSUB
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/networkInterfaces/TF-DOKU-NIC
                     - attributes
                        
                         - applied_dns_servers.#: 0
                         - dns_servers.#: 0
                         - enable_accelerated_networking: false
                         - enable_ip_forwarding: false
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/networkInterfaces/TF-DOKU-NIC
                         - internal_dns_name_label: 
                         - internal_fqdn: 
                         - ip_configuration.#: 1
                         - ip_configuration.0.application_gateway_backend_address_pools_ids.#: 0
                         - ip_configuration.0.application_security_group_ids.#: 0
                         - ip_configuration.0.load_balancer_backend_address_pools_ids.#: 0
                         - ip_configuration.0.load_balancer_inbound_nat_rules_ids.#: 0
                         - ip_configuration.0.name: TF-DOKU-IPCONF
                         - ip_configuration.0.primary: true
                         - ip_configuration.0.private_ip_address: 10.20.20.5
                         - ip_configuration.0.private_ip_address_allocation: static
                         - ip_configuration.0.public_ip_address_id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/publicIPAddresses/TF-DOKU-PIP
                         - ip_configuration.0.subnet_id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/virtualNetworks/VNET-TF-DOKU/subnets/VM-Subnet
                         - location: westeurope
                         - mac_address: 00-0D-3A-49-03-02
                         - name: TF-DOKU-NIC
                         - network_security_group_id: 
                         - private_ip_address: 10.20.20.5
                         - private_ip_addresses.#: 1
                         - private_ip_addresses.0: 10.20.20.5
                         - resource_group_name: RG-TF-DOKU
                         - tags.%: 0
                         - virtual_machine_id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Compute/virtualMachines/TF-DOKU-VM
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_public_ip.TF-DOKU-PIP
                
                 - type: azurerm_public_ip
                 - depends_on
                    
                     - 0: azurerm_resource_group.RG-TF-DOKU
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/publicIPAddresses/TF-DOKU-PIP
                     - attributes
                        
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/publicIPAddresses/TF-DOKU-PIP
                         - ip_address: 13.81.60.70
                         - location: westeurope
                         - name: TF-DOKU-PIP
                         - public_ip_address_allocation: dynamic
                         - resource_group_name: RG-TF-DOKU
                         - sku: Basic
                         - tags.%: 1
                         - tags.environment: TerraformDemo
                         - zones.#: 0
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_resource_group.RG-TF-DOKU
                
                 - type: azurerm_resource_group
                 - depends_on
                    
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU
                     - attributes
                        
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU
                         - location: westeurope
                         - name: RG-TF-DOKU
                         - tags.%: 0
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_resource_group.RG-TF-DOKU2
                
                 - type: azurerm_resource_group
                 - depends_on
                    
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU2
                     - attributes
                        
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU2
                         - location: westeurope
                         - name: RG-TF-DOKU2
                         - tags.%: 0
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_storage_account.TF-DOKU-STOR
                
                 - type: azurerm_storage_account
                 - depends_on
                    
                     - 0: azurerm_resource_group.RG-TF-DOKU
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Storage/storageAccounts/tfdokustor1906
                     - attributes
                        
                         - access_tier: 
                         - account_encryption_source: Microsoft.Storage
                         - account_kind: Storage
                         - account_replication_type: LRS
                         - account_tier: Standard
                         - account_type: Standard_LRS
                         - enable_blob_encryption: true
                         - enable_file_encryption: true
                         - enable_https_traffic_only: false
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Storage/storageAccounts/tfdokustor1906
                         - location: westeurope
                         - name: tfdokustor1906
                         - primary_access_key: r9Lfw5gGUsFUZEtWLyu8PzW8WJS/uf84kZaYeDoIHDLN7hmI0/D2ZLNFdNDq2KwmxoCFmpbJKPCjt9NfwR8ARA==
                         - primary_blob_connection_string: DefaultEndpointsProtocol=https;BlobEndpoint=https://tfdokustor1906.blob.core.windows.net/;AccountName=tfdokustor1906;AccountKey=r9Lfw5gGUsFUZEtWLyu8PzW8WJS/uf84kZaYeDoIHDLN7hmI0/D2ZLNFdNDq2KwmxoCFmpbJKPCjt9NfwR8ARA==
                         - primary_blob_endpoint: https://tfdokustor1906.blob.core.windows.net/
                         - primary_connection_string: DefaultEndpointsProtocol=https;AccountName=tfdokustor1906;AccountKey=r9Lfw5gGUsFUZEtWLyu8PzW8WJS/uf84kZaYeDoIHDLN7hmI0/D2ZLNFdNDq2KwmxoCFmpbJKPCjt9NfwR8ARA==;EndpointSuffix=core.windows.net
                         - primary_file_endpoint: https://tfdokustor1906.file.core.windows.net/
                         - primary_location: westeurope
                         - primary_queue_endpoint: https://tfdokustor1906.queue.core.windows.net/
                         - primary_table_endpoint: https://tfdokustor1906.table.core.windows.net/
                         - resource_group_name: RG-TF-DOKU
                         - secondary_access_key: W0CJlQfRHIWLFw1OZMBFeL0jwV2NeCXBN4nj5CRvOd6J2UYqHL7p/TOuWDfXPXiyKQLyqY+p7d7FwWBeK9X7bA==
                         - secondary_connection_string: DefaultEndpointsProtocol=https;AccountName=tfdokustor1906;AccountKey=W0CJlQfRHIWLFw1OZMBFeL0jwV2NeCXBN4nj5CRvOd6J2UYqHL7p/TOuWDfXPXiyKQLyqY+p7d7FwWBeK9X7bA==;EndpointSuffix=core.windows.net
                         - secondary_location: 
                         - tags.%: 1
                         - tags.environment: prod
                        
                     - meta
                        
                         - schema_version: 2
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_storage_container.TF-DOKUTFSTORCONT
                
                 - type: azurerm_storage_container
                 - depends_on
                    
                     - 0: azurerm_resource_group.RG-TF-DOKU
                     - 1: azurerm_storage_account.TF-DOKU-STOR
                    
                 - primary
                    
                     - id: vhd
                     - attributes
                        
                         - container_access_type: private
                         - id: vhd
                         - name: vhd
                         - properties.%: 4
                         - properties.last_modified: Thu, 27 Jun 2019 11:59:27 GMT
                         - properties.lease_duration: infinite
                         - properties.lease_state: leased
                         - properties.lease_status: locked
                         - resource_group_name: RG-TF-DOKU
                         - storage_account_name: tfdokustor1906
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_subnet.VNET-TF-DOKUSUB
                
                 - type: azurerm_subnet
                 - depends_on
                    
                     - 0: azurerm_resource_group.RG-TF-DOKU
                     - 1: azurerm_virtual_network.VNET-TF-DOKU
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/virtualNetworks/VNET-TF-DOKU/subnets/VM-Subnet
                     - attributes
                        
                         - address_prefix: 10.20.20.0/24
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/virtualNetworks/VNET-TF-DOKU/subnets/VM-Subnet
                         - ip_configurations.#: 1
                         - ip_configurations.3122837172: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/networkInterfaces/TF-DOKU-NIC/ipConfigurations/TF-DOKU-IPCONF
                         - name: VM-Subnet
                         - resource_group_name: RG-TF-DOKU
                         - service_endpoints.#: 0
                         - virtual_network_name: VNET-TF-DOKU
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_virtual_machine.TF-DOKU-VM
                
                 - type: azurerm_virtual_machine
                 - depends_on
                    
                     - 0: azurerm_network_interface.TF-DOKU-NIC
                     - 1: azurerm_resource_group.RG-TF-DOKU
                     - 2: azurerm_storage_account.TF-DOKU-STOR
                     - 3: azurerm_storage_container.TF-DOKUTFSTORCONT
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Compute/virtualMachines/TF-DOKU-VM
                     - attributes
                        
                         - delete_data_disks_on_termination: false
                         - delete_os_disk_on_termination: false
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Compute/virtualMachines/TF-DOKU-VM
                         - identity.#: 0
                         - location: westeurope
                         - name: TF-DOKU-VM
                         - network_interface_ids.#: 1
                         - network_interface_ids.0: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/networkInterfaces/TF-DOKU-NIC
                         - os_profile.#: 1
                         - os_profile.1151202616.admin_password: 
                         - os_profile.1151202616.admin_username: vmadmin
                         - os_profile.1151202616.computer_name: TF-DOKU-VM
                         - os_profile.1151202616.custom_data: 
                         - os_profile_linux_config.#: 1
                         - os_profile_linux_config.2972667452.disable_password_authentication: false
                         - os_profile_linux_config.2972667452.ssh_keys.#: 0
                         - os_profile_secrets.#: 0
                         - resource_group_name: RG-TF-DOKU
                         - storage_data_disk.#: 0
                         - storage_image_reference.#: 1
                         - storage_image_reference.1846530774.id: 
                         - storage_image_reference.1846530774.offer: UbuntuServer
                         - storage_image_reference.1846530774.publisher: Canonical
                         - storage_image_reference.1846530774.sku: 14.04.2-LTS
                         - storage_image_reference.1846530774.version: latest
                         - storage_os_disk.#: 1
                         - storage_os_disk.0.caching: ReadWrite
                         - storage_os_disk.0.create_option: FromImage
                         - storage_os_disk.0.disk_size_gb: 30
                         - storage_os_disk.0.image_uri: 
                         - storage_os_disk.0.managed_disk_id: 
                         - storage_os_disk.0.managed_disk_type: 
                         - storage_os_disk.0.name: myosdisk
                         - storage_os_disk.0.os_type: Linux
                         - storage_os_disk.0.vhd_uri: https://tfdokustor1906.blob.core.windows.net/vhd/myosdisk.vhd
                         - tags.%: 1
                         - tags.environment: prod
                         - vm_size: Standard_A2
                         - zones.#: 0
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
             - azurerm_virtual_network.VNET-TF-DOKU
                
                 - type: azurerm_virtual_network
                 - depends_on
                    
                     - 0: azurerm_resource_group.RG-TF-DOKU
                    
                 - primary
                    
                     - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/virtualNetworks/VNET-TF-DOKU
                     - attributes
                        
                         - address_space.#: 1
                         - address_space.0: 10.20.20.0/24
                         - dns_servers.#: 0
                         - id: /subscriptions/929c2539-bb82-4745-9be2-83580700ed98/resourceGroups/RG-TF-DOKU/providers/Microsoft.Network/virtualNetworks/VNET-TF-DOKU
                         - location: westeurope
                         - name: VNET-TF-DOKU
                         - resource_group_name: RG-TF-DOKU
                         - subnet.#: 1
                         - subnet.1534916562.address_prefix: 10.20.20.0/24
                         - subnet.1534916562.name: VM-Subnet
                         - subnet.1534916562.security_group: 
                         - tags.%: 0
                        
                     - meta
                        
                        
                     - tainted: false
                    
                 - deposed
                    
                    
                 - provider: provider.azurerm
                
            
         - depends_on
            
            
        
    
