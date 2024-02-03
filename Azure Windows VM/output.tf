output "rg_name" { 
     value = azurerm_resource_group.rg.name 
 } 

 output "vnet_name" { 
     value = azurerm_virtual_network.vnet_tf.name 
 } 

 output "win_vm_name" { 
     value = azurerm_windows_virtual_machine.win_vm_tf.name 
 } 

 output "win_vm_public_ip" { 
     value = azurerm_windows_virtual_machine.win_vm_tf.public_ip_address 
 }