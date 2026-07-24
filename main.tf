terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami           = "ami-02167eae61967e403"
  instance_type = "t3.micro"
  key_name = "LUCAS-OREGON"
  # user_data = <<-EOF
  #                #!/bin/bash
  #                cd /home/ubuntu
  #                echo "chegou aqui"
  #                echo "<h1>Teste terraform</h1>" > index.html
  #                nohup busybox httpd -f -h /home/ubuntu -p 8000 &
  #                EOF
  tags = {
    Name = "terraform ansible pyton"
  }
}