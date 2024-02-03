variable "res_grp_name" {
    type    = string  
    default = "terraform-resources"  
}  

variable "location" {  
    type    = string  
    default = "eastus"  
} 

variable "vnet_name" {  
    type    = string  
    default = "Vnet-tf"  
} 

variable "subnet_name" {  
    type    = string  
    default = "subnet1-tf"  
} 

variable "publicip_name" {  
    type    = string  
    default = "pubIp-tf"  
} 

variable "nsg_name" {  
    type    = string  
    default = "nsg-tf"  
} 

variable "nic_name" {  
    type    = string  
    default = "nic-tf"  
} 

variable "vm_name" {  
    type    = string  
    default = "vm-tf"  
} 

variable "username" {
    type    = string
    default = "winusertf"
}

variable "passwd" {
    type    = string
    default = "password123"
}