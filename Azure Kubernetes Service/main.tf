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
   name     = var.res_grp_name 
   location = var.location 
}

resource "azurerm_kubernetes_cluster" "kube_cluster_tf" {
  name                = var.kube_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_tier            = "Free"
  dns_prefix          = "aks-tf-dev"
    
  default_node_pool {
    name       = "nodepooltf"
    node_count = var.node_count
    vm_size    = "Standard_D2_v2"
    os_sku     = "Ubuntu"
    enable_auto_scaling = false 
    type       = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.nodes_username

    ssh_key {
      key_data = "<ssh_public_key_data>"
    }
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
    network_policy    = "calico"
  }
}
 
