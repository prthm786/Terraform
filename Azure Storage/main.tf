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
} 

resource "azurerm_resource_group" "rg" { 
   name     = var.resource_group
   location = var.location
} 

resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
} 

resource "azurerm_storage_blob" "storage_blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = var.filepath
}