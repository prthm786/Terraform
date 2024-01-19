variable "res_grp_name" { 
   type    = string 
   default = "terraform_resources" 
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
   default = "NSG-tf" 
}

variable "nic_name" { 
   type    = string 
   default = "NIC-tf" 
}

variable "vm_name" { 
   type    = string 
   default = "VM-tf" 
}
