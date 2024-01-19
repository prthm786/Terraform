variable "res_grp_name" {   
     type    = string   
     default = "terraform_resources"   
}  
  
variable "location" {   
     type    = string   
     default = "eastus"   
}  
 
variable "kube_cluster_name" {   
     type    = string   
     default = "aks_tf"   
}  
 
variable "node_count" {
  type        = number
  default     = 2
}

variable "nodes_username" {
  type        = string
  default     = "azureusertf"
}
