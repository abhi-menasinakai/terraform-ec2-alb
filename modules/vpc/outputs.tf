output "vpc_id" {
  value = aws_vpc.my-vpc.id
}
output "subnet_IDs" {
  value = aws_subnet.subnets.*.id
}