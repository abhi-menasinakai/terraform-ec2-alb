variable "vpc_cidr" {
  type = string
  description = "vpc cidr range"
  }

variable "subnet_cidr" {
   type = list(string)
   description = "subnet cidrs"
  }

variable "subnet_names" {
  description = "Subnet names for VPC"
  type = list(string)
  default = [ "PublicSubnet1", "PublicSubnet2" ]
  }

