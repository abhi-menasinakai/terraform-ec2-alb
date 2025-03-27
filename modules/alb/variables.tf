variable "sg_id" {
  description = "SG ID for ALB"
  type = string
}

variable "subnet_id" {
  description = "subnets for ALB"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc id"
  type = string
}

variable "instances" {
  description = "instance ID for tga"
  type = list(string)
}