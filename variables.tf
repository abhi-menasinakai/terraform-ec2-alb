variable "vpc_cidr" {
  type        = string
  description = "vpc cidr range"
}

variable "subnet_cidr" {
  type        = list(string)
  description = "subnet cidrs"
}

