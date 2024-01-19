output "rg_name" {
    value = azurerm_resource_group.rg.name
}

output "vnet_name" {
    value = azurerm_virtual_network.vnet_tf.name
}

output "vm_name" {
    value = azurerm_linux_virtual_machine.vm_tf.name
}

output "vm_public_ip" {
    value = azurerm_linux_virtual_machine.vm_tf.public_ip_address
}
