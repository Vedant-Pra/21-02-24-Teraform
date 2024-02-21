terraform {
required_providers {
aws = {
source  = "hashicorp/aws"
version = "~> 3.0"
}
}
}


# Configure the AWS provider

provider "aws" {
region = "us-east-1" # Replace with your desired region
access_key = "ASIA4DKL55CCMYVGDMSB"
secret_key = "kw+KhqNj+XDw9bCKiVKGmVklw4SLDL3SvqdXrFlh"
token = "FwoGZXIvYXdzEGwaDI1PtvUTtau0xl7XHiKvAWTAHQbipFxdotTtDMsOIdvdEilZPNpBbGKEbLRef2rEpgzKZagC+BOvBo680rK9wLLSg+4f594hMpe+ZXdhSJABLFyq4oGkiRJvAMQpqg8ZEO3rjbqfTTJp0gErtX/xyoeXiIDFNHREmmXjlSJLMggTNC04qHUXeYL9S/vmK13nzXZxv5/wMoos+Vmg6kO49amU+RGnJ9ABIH6gMohcvrIqxQqDD35gOWzSC0/SxxQou5rXrgYyLYXdBIyCXysn+ZE/OjBGinsPKKojA6aG/tpUDHtBLs+UJjJHHxu3XJr5qx2EIA=="
}
