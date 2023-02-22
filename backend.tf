terraform {
  backend "s3" {
    bucket         = "da-blue-green-project-123456-tfstates"
    key            = "github-portfolio/projects/blue-green-deployment/terraform.tfstates"
    dynamodb_table = "terraform-blue-green-lock"
  }
}