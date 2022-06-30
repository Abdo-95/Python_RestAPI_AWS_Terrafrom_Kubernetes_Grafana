resource "aws_elastic_beanstalk_application" "app2" {
  name = "application-terraform"

  appversion_lifecycle {
    service_role          = "arn:aws:iam::564409215904:role/aws-elasticbeanstalk-service-role"
    max_count             = 128
    delete_source_from_s3 = true
  }
}
resource "aws_elastic_beanstalk_environment" "app" {
  setting {
    name      = "AppSource"
    namespace = "aws:cloudformation:template:parameter"
    resource  = ""
    value     = "https://cloudbootcamp-123.s3.eu-central-1.amazonaws.com/Dockerrun.aws.json?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHcaCWV1LXdlc3QtMiJHMEUCIQDtuKGHBtcYO7tIYeisWlNVJYwgUgGroJ%2BzSDGP%2FRyoWAIgC1zdzcfpc32R1ysGFIe6rmWbK2yyp5QHyXrOlJjTq7kqjwQIMBAAGgw1NjQ0MDkyMTU5MDQiDCzK2wsuGJBphxcyMCrsAzntL72kPfDB26QWZn%2F6kP4FYxrXe9f%2Fe6sByPZYr2ZjaRNrnNDX2deEwSCT7lHN9aOsfAi2zhlAqijulo6ggxrzJPT53SkjgtpBlgy2uPGzx3XdlC3W8c8p89ls4b2MLyE7MriosuUt8%2FDM8myndSpLLRr7R4KgsdUkFCKwZM0vVVLjhGFFfMEUh1oYtRZ62eJhOAWxKDEK4CXoRGz2hBvbfafdCKSJYlR4hb6TumGbox7zqn9tr1O1vQpdMqhbCiKOcImWFP9QwdAJkxqv77RSc0BD7G2UCWvvNvw2TT5iRNuuYSNmTqcaJrhrv0dEGk79VGD59iu1pUNcEBHcoovh6jkmbOiJg%2BbE6QCr99Bqbq%2FTjmVmePHn1Z%2FPOVyEIAkUvl0DjxWxpZfc5ka8KzXTTYUXY6q%2FZjS%2B3LF9aJ6DUtf8QLAuYM2soagiz7v2Bkp2cMZ5BrY9TqkxTqW7M1OmnihScDmi%2BWEe8tUyxgqQ%2FX1iq8FzZragjjBztLJgjW7ij9PU2GsGt7K0tgcZw3RQrOuoENcxP5seIUVMtHaKwwYUdj%2BGPWgc8vAI30dvMek8lREnKPyir8%2BNU6WY76ykgO0sC1ur4%2BSIaA2ip%2Bb2Mj3S8DUdNORH5apP7RLqeRNaExwKB439NmvOXTCt0IWTBjqUAqcB0qdRclw%2FKpUqDnzMZbGjAa9HCjB02BOrwTajTRyM%2Bs1eEvegBtSddAErzGSc4WZJVsgx3LIe7IbPOI6wesphZfyRwXL8d3qmghBGsGvogdCTZM3nqQjCi2DHc%2F%2FWLJfR%2FawakiLLMpGO8uorumB%2FsP89zqjUjUHN4p5yboiOGNpQUNeqFrXrsUgCOBlKBE2pLYZtd6ls3%2BantR44ro1BhG46uLddkRQmonAkFXdxLRalHUvccnl7g%2B3LT%2B0F091FcutYLZZt%2FEhb4XZFoTDI6ENcn2%2B6GvOLBH9V18Xfezvnf0EFURvGQx8rgbaa8zdPQbESwG8dDsONrlqwFa%2F3KahZXsH%2FN1FDL5nZyNrx%2FmsaUg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220421T145655Z&X-Amz-SignedHeaders=host&X-Amz-Expires=43200&X-Amz-Credential=ASIAYG2LJFOQH5ZIFHZJ%2F20220421%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Signature=7c99a0b4bdf22ad8d8c39453569cc7a3c50c75cccb95a899206c99317e761e3c"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    name      = "ServiceRole"
    namespace = "aws:elasticbeanstalk:environment"
    resource  = ""
    value     = "arn:aws:iam::564409215904:role/aws-elasticbeanstalk-service-role"
  }
  application         = "application-terraform"
  name                = "Environment-terraform"
  solution_stack_name = "64bit Amazon Linux 2 v3.4.13 running Docker"
}