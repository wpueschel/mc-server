# Location and rg
variable location {
  default = "westeurope"
}

variable "rg_name" {
  default = "minecraft"
}

# Networking
variable "net_range" {
  default = "192.168.0.0/16"
}

variable "subnet_range" {
  default = "192.168.1.0/24"
}

# Machine
variable "vm_size" {
  default = "Standard_D2_v4"
}

variable "server_name" {
  default = "minecraft"
}
