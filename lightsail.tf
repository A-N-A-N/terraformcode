resource "aws_lightsail_instance" "web_server" {
  name              = "my-web-server"
  availability_zone = "us-east-1a" # Replace with your desired availability zone
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_2_0"

  user_data = <<-EOT
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html
              EOT

  key_pair_name = "AWS02" # Replace with your existing key pair name
}

output "public_ip" {
  value = aws_lightsail_instance.web_server.public_ip_address
}
