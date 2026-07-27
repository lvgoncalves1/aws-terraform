module "aws_dev" {
  source = "../../infra"
  instancia = "t3.micro"
  regiao_aws = "us-west-2"
  chave = "project-dev"
  ambiente = "dev"
  grupoDeSeguranca = "DEV"
  minimo = 0
  maximo = 10
  nomeGrupo = "Dev"
}

output "IP" {
  value = module.aws_dev.IP_publico
}