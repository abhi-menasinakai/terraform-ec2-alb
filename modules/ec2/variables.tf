variable "sg_id" {
  description = "SG id for EC2"
  type = string
}

variable "subnets" {
  description = "subnets for ec2"
  type = list(string)
}

variable "ec2_names" {
  description = "name for ec2"
  type = list(string)
  default = [ "webServer1", "webServer2" ]
}