resource "aws_codecommit_repository" "codecommit" {
  repository_name = "cloudbootcamp-abdulrahman-arnous-repository-terraform"
  description     = "This Repository was made via Terraform"
  default_branch  = "master"
}