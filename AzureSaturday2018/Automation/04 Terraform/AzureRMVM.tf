variable "resourcesname" {
  default = "AZSTF"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "t.b.d."
  client_id       = "t.b.d."
  client_secret   = "t.b.d."
  tenant_id       = "t.b.d."
}

# create a resource group if it doesn't exist
resource "azurerm_resource_group" "RGAZSTF" {
    name = "RG-AZS-TF"
    location = "West Europe"
}

# create virtual network
resource "azurerm_virtual_network" "VNETAZSTF" {
    name = "VNET-AZS_TF"
    address_space = ["10.20.20.0/24"]
    location = "West Europe"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
}

# create subnet
resource "azurerm_subnet" "VNETAZSTFSUB" {
    name = "VM-Subnet"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
    virtual_network_name = "${azurerm_virtual_network.VNETAZSTF.name}"
    address_prefix = "10.20.20.0/24"
}


# create public IPs
resource "azurerm_public_ip" "AZSTFPIP" {
    name = "AZSTFPIP"
    location = "West Europe"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
    public_ip_address_allocation = "dynamic"

    tags {
        environment = "TerraformDemo"
    }
}

# create network interface
resource "azurerm_network_interface" "AZSTFNIC" {
    name = "AZSTFNIC"
    location = "West Europe"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"

    ip_configuration {
        name = "AZSIPCONF"
        subnet_id = "${azurerm_subnet.VNETAZSTFSUB.id}"
        private_ip_address_allocation = "static"
        private_ip_address = "10.20.20.5"
        public_ip_address_id = "${azurerm_public_ip.AZSTFPIP.id}"
    }
}

# create storage account
resource "azurerm_storage_account" "AZSTFSTOR" {
    name = "AZStfstor1805"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
    location = "westeurope"
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags {
        environment = "prod"
    }
}

# create storage container
resource "azurerm_storage_container" "AZSTFSTORCONT" {
    name = "vhd"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
    storage_account_name = "${azurerm_storage_account.AZSTFSTOR.name}"
    container_access_type = "private"
    depends_on = ["azurerm_storage_account.AZSTFSTOR"]
}

# create virtual machine
resource "azurerm_virtual_machine" "AZSTFVM" {
    name = "AZSTFVM"
    location = "West Europe"
    resource_group_name = "${azurerm_resource_group.RGAZSTF.name}"
    network_interface_ids = ["${azurerm_network_interface.AZSTFNIC.id}"]
    vm_size = "Standard_A2"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "14.04.2-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "myosdisk"
        vhd_uri = "${azurerm_storage_account.AZSTFSTOR.primary_blob_endpoint}${azurerm_storage_container.AZSTFSTORCONT.name}/myosdisk.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "AZSTFVM"
        admin_username = "vmadmin"
        admin_password = "AZSpwd2018!"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    tags {
        environment = "prod"
    }
}