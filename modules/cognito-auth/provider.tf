provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile  # Optional: Only needed if you're using a named profile
}
