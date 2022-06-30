resource "aws_codepipeline" "codepipeline" {
  name     = "Cloudbootcamp-abdulrahman-arnous-Pipeline-Terraform"
  role_arn = "arn:aws:iam::564409215904:role/service-role/AWSCodePipelineServiceRole-eu-central-1-Cloudbootcamp-abdulrahm"


  artifact_store {
    location = "codepipeline-eu-central-1-507594243001"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "BranchName"           = "master"
        "OutputArtifactFormat" = "CODE_ZIP"
        "PollForSourceChanges" = "false"
        "RepositoryName"       = "cloudbootcamp-abdulrahman-arnous-repository-terraform"
      }
      name      = "Source"
      namespace = "SourceVariables"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner    = "AWS"
      provider = "CodeCommit"
      region   = "eu-central-1"
      version  = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "ProjectName" = "Cloudbootcamp-abdulrahman-arnous-Build-Terraform"
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name      = "Build"
      namespace = "BuildVariables"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner    = "AWS"
      provider = "CodeBuild"
      region   = "eu-central-1"
      version  = "1"
    }
  }
}