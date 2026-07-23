variable "global_variables" {
  description = "Global variables"
  type        = any
  default = {
    prefix      = "stepora-"
    suffix      = "-tf"
    region      = "ap-south-1"
    environment = "production"
    account     = "stepora"

    default_tags = {
      "Region"      = "UAE"
      "Environment" = "production"
      "CreatedBy"   = "Terraform"
      "Account"     = "stepora"
    }
  }
}
