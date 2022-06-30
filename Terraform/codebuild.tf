
resource "aws_codebuild_project" "test" {

  name               = "Cloudbootcamp-abdulrahman-arnous-Build-Terraform"
  project_visibility = "PRIVATE"
  service_role       = "arn:aws:iam::564409215904:role/service-role/codebuild-Cloudbootcamp-abdulrahman-arnous-Build-service-role"
  source_version     = "refs/heads/master"

  artifacts {
    encryption_disabled    = false
    override_artifact_name = false
    type                   = "NO_ARTIFACTS"
  }

  cache {
    modes = []
    type  = "NO_CACHE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      type  = "PLAINTEXT"
      value = "eu-central-1"
    }
    environment_variable {
      name  = "IMAGE_REPO_NAME"
      type  = "PLAINTEXT"
      value = "cloudbootcamp-abdulrahman-arnous-registry"
    }
    environment_variable {
      name  = "IMAGE_TAG"
      type  = "PLAINTEXT"
      value = "latest"
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      type  = "PLAINTEXT"
      value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["AWS_ACCOUNT_ID"]
    }
    environment_variable {
      name  = "default_db_ip"
      type  = "PLAINTEXT"
      value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["default_db_ip"]
    }
    environment_variable {
      name  = "default_db_user"
      type  = "PLAINTEXT"
      value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["default_db_user"]
    }
    environment_variable {
      name  = "default_db_password"
      type  = "PLAINTEXT"
      value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["default_db_password"]
    }
    environment_variable {
      name  = "default_db_name"
      type  = "PLAINTEXT"
      value = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["default_db_name"]
    }
    environment_variable {
      name  = "db_charset"
      type  = "PLAINTEXT"
      value = "utf8mb4"
    }
    environment_variable {
      name  = "ECR_NAME"
      type  = "PLAINTEXT"
      value = "cloudbootcamp-abdulrahman-arnous-registry"
    }
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }
  source {
    location            = "https://git-codecommit.eu-central-1.amazonaws.com/v1/repos/cloudbootcamp-abdulrahman-arnous-repository-terraform"
    report_build_status = false
    type                = "CODECOMMIT"
  }
}