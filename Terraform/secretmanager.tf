resource "aws_secretsmanager_secret" "secret" {
  name = "Terraform_Secret"
}
data "aws_secretsmanager_secret" "secret2" {
  name = "Terraform_Secret"
}
data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.secret2.id
}