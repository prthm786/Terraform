variable "resource_group" {
  type    = string
  default = "terraform_resources"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "storage_account_name" {
  type    = string
  default = "storage-acc-tf" 
}

variable "container_name" {
  type    = string
  default = "container-tf"
}

variable "blob_name" { 
  type    = string
  default = "test.txt"
}

variables "file_path" {
  type    = string
  default = "test.txt"
}