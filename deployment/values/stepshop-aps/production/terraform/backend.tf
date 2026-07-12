terraform {
  backend "s3" {
    use_lockfile = "true"

    region = "us-east-1"
    bucket = "stepora-production-terraform-state-tf"

    key = "stepora/production/applications-v2/eks-v2/stepshop-aps.tfstate"
  }
}
