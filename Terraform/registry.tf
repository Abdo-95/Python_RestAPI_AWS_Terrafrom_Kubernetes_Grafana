resource "aws_ecr_repository" "ECRregistry" {
  name                 = "cloudbootcamp-abdulrahman-arnous-registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}   