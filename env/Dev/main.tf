module "aws_dev" {
  source = "../../infra"
  instancia = "t3.micro"
  regiao_aws = "us-west-2"
  chave = "project-dev"
  ambiente = "dev"
}

output "IP" {
  value = module.aws_dev.IP_publico
}