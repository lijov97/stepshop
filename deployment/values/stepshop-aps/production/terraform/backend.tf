terraform {
  backend "s3" {
    dynamodb_table = "stepora-production-terraform-state-tf"

    region = "us-east-1"
    bucket = "stepora-production-terraform-state-tf-bucket"

    key = "stepora/production/applications-v2/eks-v2/stepshop-aps.tfstate"
  }
}
