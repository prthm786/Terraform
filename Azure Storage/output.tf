output "rg_name" {
    value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
    value = azurerm_storage_account.storage_account.name 
}

output "storage_container_name" {
    value = azurerm_storage_container.storage_container.name 
}

output "storage_blob_name" {
    value = azurerm_storage_blob.storage_blob.name 
}

