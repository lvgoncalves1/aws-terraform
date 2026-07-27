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
  region = var.regiao_aws
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_launch_template" "maquina" {
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instancia
  key_name      = aws_key_pair.chaveSSH.key_name
  tags = {
    Name = "terraform ansible pyton"
  }
  security_group_names = [ var.grupoDeSeguranca ]
}


resource "aws_key_pair" "chaveSSH"{
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}

resource "aws_autoscaling_group" "grupo" {
  name = var.nomeGrupo
  max_size = var.maximo
  min_size = var.minimo
  launch_template {
    id = aws_launch_template.maquina.id
    version = "$Latest"
  }
}