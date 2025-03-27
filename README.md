# Terraform-ec2-alb
This repository contains terraform code to create VPC, ec2 instances and ALB 

I have added modules to create infrastructure using terraform. Modules include application load balancer, ec2, security group and vpc.
The provider.tf file contains remote backend along with dynamodb table in order to store statefile in S3 and enable locking during usage.

#VPC Module: 

This module creates vpc in us-east-1 region with two subnets created in two avaialbility zones. It also creates internet gateway and Route tables.

#SecurityGroup module:

While Security group module creates security group enabling port 80 and 22 for incoming HTTP and SSH traffic. This also enables all outgoing traffic rule as outbound.

#EC2 Module:

This module creates two EC2 instances in two different availability zones with diffrent subnets. Attches the security group created by SG module. It allows public IP for the instances.
The instances will have ubuntu OS and user data which installs apache server and hosts file which shows instance ID.

#ALB Module:

This module creates application load balancer along with Listener and Target groups which will then attached to instances.

Thanks for Reading...!

