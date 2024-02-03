terraform { 
   required_providers { 
     azurerm = { 
       source  = "hashicorp/azurerm" 
       version = "~> 3.0.2" 
     } 
   } 
   required_version = ">= 1.1.0" 
} 

provider "azurerm" { 
   features {} 
   skip_provider_registration = "true" 
} 

resource "azurerm_resource_group" "rg" { 
   name     = var.res_grp_name 
   location = var.location 
} 

resource "azurerm_virtual_network" "vnet_tf" { 
   name                = var.vnet_name 
   address_space       = ["192.168.0.0/16"] 
   location            = azurerm_resource_group.rg.location 
   resource_group_name = azurerm_resource_group.rg.name 
} 

resource "azurerm_subnet" "subnet1_tf" { 
   name                 = var.subnet_name 
   resource_group_name  = azurerm_resource_group.rg.name 
   virtual_network_name = azurerm_virtual_network.vnet_tf.name 
   address_prefixes     = ["192.168.4.0/24"] 
} 

resource "azurerm_public_ip" "publicip_tf" { 
   name = var.publicip_name 
   resource_group_name = azurerm_resource_group.rg.name 
   location = azurerm_resource_group.rg.location 
   allocation_method = "Dynamic" 
} 

resource "azurerm_network_security_group" "nsg_tf" { 
   name                = var.nsg_name 
   location            = azurerm_resource_group.rg.location 
   resource_group_name = azurerm_resource_group.rg.name 
} 

resource "azurerm_network_security_rule" "nsg_rule" {  
    name                        = "RDP"  
    priority                    = 100  
    direction                   = "Inbound"  
    access                      = "Allow"  
    protocol                    = "Tcp"  
    source_port_range           = "*"  
    destination_port_range      = "3389"  
    source_address_prefix       = "*"  
    destination_address_prefix  = "*"  
    resource_group_name         = azurerm_resource_group.rg.name  
    network_security_group_name = azurerm_network_security_group.nsg_tf.name  
}  


resource "azurerm_network_interface" "nic_tf" { 
   name                = var.nic_name 
   location            = azurerm_resource_group.rg.location 
   resource_group_name = azurerm_resource_group.rg.name 

   ip_configuration { 
     name                          = "internal" 
     subnet_id                     = azurerm_subnet.subnet1_tf.id 
     private_ip_address_allocation = "Dynamic" 
     public_ip_address_id = azurerm_public_ip.publicip_tf.id 
   } 
} 

resource "azurerm_network_interface_security_group_association" "nic_nsg" { 
   network_interface_id      = azurerm_network_interface.nic_tf.id 
   network_security_group_id = azurerm_network_security_group.nsg_tf.id 
} 

resource "azurerm_windows_virtual_machine" "win_vm_tf" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s"
  admin_username      = var.username
  admin_password      = var.passwd
  network_interface_ids = [
    azurerm_network_interface.nic_tf.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "win10-21h2-pro-g2"
    version   = "latest"
  }
}
