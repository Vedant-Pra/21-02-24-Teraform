
# # Configure the AWS provider

# provider "aws" {
# region = "us-east-1" # Replace with your desired region
# access_key = "ASIA4DKL55CCNFRRASN5"
# secret_key = "7gIn78eTnnY2H2pkF/vw66Jl3R/NnEqKDmfA8ICd"
# token = "FwoGZXIvYXdzEGsaDAesDP0kZCrHnjDhbCKvAVaqiraGhAjDPzRFRcnSJbfFFfhkEJGE4NCSDDJ1c1b27ygiQXk3fDJzhPphbhduAaS717yYS+jbQi7VSRxDy/H15wn9UQTqiZayhXIOgb3MILEZs5g1eUVAq4KHLBzFWrn3GvLffpyXrkFgWiu1lG3GqZby85hm38Ky03Z7US+4nX7Wn71N+zuzPqeUlcIJIPsz3cKGWbgOkNQWncD4ZqFjs76W4nEFTUynaiL75E0osIfXrgYyLaEFZuzmwrptaJ1ooXI3bV3UQJyshaK/mpCrfUT4M+ZY5yJ/uSQ1cJvUSjCFgA=="
# }

# # Create a VPC with CIDR block and appropriate tags

# resource "aws_vpc" "main" {
# cidr_block = "10.0.0.0/16"

# tags = {
# Name = "My VPC"
# }
# }

# # Create a public subnet with CIDR block, availability zone, and tags

# resource "aws_subnet" "public" {
# vpc_id            = aws_vpc.main.id
# cidr_block        = "10.0.1.0/24"
# availability_zone = "us-east-1a" # Replace with your desired AZ

# tags = {
# Name = "Public Subnet"
# }
# }

# # Create an internet gateway and add appropriate tags

# resource "aws_internet_gateway" "gw" {
# vpc_id = aws_vpc.main.id

# tags = {
# Name = "Internet Gateway"
# }
# }

# # Create a route table with a route to the internet gateway and tags

# resource "aws_route_table" "public_route_table" {
# vpc_id = aws_vpc.main.id

# route {
# cidr_block = "0.0.0.0/0"
# gateway_id = aws_internet_gateway.gw.id
# }

# tags = {
# Name = "Public Route Table"
# }
# }

# # Associate the public route table with the public subnet

# resource "aws_route_table_association" "public_subnet_route_table_assoc" {
# subnet_id         = aws_subnet.public.id
# route_table_id    = aws_route_table.public_route_table.id
# }



# # Create a security group with SSH access rules and tags

# resource "aws_security_group" "ssh" {
# name = "SSH"
# vpc_id = aws_vpc.main.id

# ingress {
# from_port = 22
# to_port = 22
# protocol = "tcp"
# cidr_blocks = ["0.0.0.0/0"] # Restrict this for production environments

# }

# egress {
# from_port = 0
# to_port = 0
# protocol = "-1"
# cidr_blocks = ["0.0.0.0/0"]
# }

# tags = {
# Name = "SSH Security Group"
# }
# }

# # Create an EC2 instance with desired AMI, instance type, security group IDs, subnet ID, and tags

# resource "aws_instance" "webserver" {
# ami           = "ami-0f9c44e98edf38a2b" # Replace with your desired AMI
# instance_type = "t2.micro" # Replace with your desired instance type
# vpc_security_group_ids = [aws_security_group.ssh.id]
# subnet_id = aws_subnet.public.id
# associate_public_ip_address = "true"
# key_name = "TeraformKeyPair"

# tags = {
# Name = "Web Server"
# }

# # Consider adding user data script for initial configuration

# # user_data = file("user_data.sh")

# # Consider adding volume configurations for persistent storage

# # # ...

# }

# # Output the public IP address of the instance

# output "public_ip" {
# value = aws_instance.webserver.public_ip
# }