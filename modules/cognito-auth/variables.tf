variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  default     = "example-user-pool"
}

variable "user_pool_client_name" {
  description = "Name of the Cognito User Pool Client"
  default     = "example-client"
}

variable "callback_urls" {
  description = "List of allowed callback URLs"
  default     = ["http://localhost:3000/callback"]
}

variable "logout_urls" {
  description = "List of allowed logout URLs"
  default     = ["http://localhost:3000/logout"]
}

variable "create_user_pool_domain" {
  description = "Whether to create a user pool domain"
  type        = bool
  default     = true
}

variable "user_pool_domain" {
  description = "Custom domain prefix for the Cognito User Pool"
  type        = string
  default     = "my-app-auth"
}
