module "aws_prod" {
  source = "../../infra"
  instancia = "t3.micro"
  regiao_aws = "us-west-2"
  chave = "project-prod"
  ambiente = "prod"
  grupoDeSeguranca = "Producao"
  minimo = 1
  maximo = 10
  nomeGrupo = "Prod"
}


