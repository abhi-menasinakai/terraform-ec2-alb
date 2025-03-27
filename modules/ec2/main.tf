resource "aws_instance" "web" {
  count = length(var.ec2_names)
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  subnet_id = var.subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data = <<-EOF
  #!/bin/bash
  set -e
  # Update and install Apache
  sudo apt-get update -y
  sudo apt-get install -y apache2

  # Get the EC2 instance ID from metadata
  INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

  # Create content for index.html with dynamic instance ID
  cat <<HTML > /var/www/html/index.html
  <!DOCTYPE html>
  <html>
  <head>
      <title>Welcome to EC2</title>
  </head>
  <body>
      <h1>Welcome to EC2 Instance</h1>
      <p>This is a sample page served from an Apache server!</p>
      <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
  </body>
  </html>
  HTML

  # Start and enable Apache
  sudo systemctl start apache2
  sudo systemctl enable apache2
  EOF 

  tags = {
    "Name" = var.ec2_names[count.index]
  }
}