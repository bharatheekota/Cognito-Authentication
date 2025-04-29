variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
}

variable "user_pool_client_name" {
  description = "Name of the Cognito User Pool client"
  type        = string
}

variable "callback_urls" {
  description = "List of allowed callback URLs for the client"
  type        = list(string)
  default     = ["http://localhost:3000"]
}

variable "logout_urls" {
  description = "List of allowed logout URLs"
  type        = list(string)
  default     = ["http://localhost:3000/logout"]
}

variable "create_user_pool_domain" {
  description = "Whether to create a Cognito user pool domain"
  type        = bool
  default     = true
}

variable "user_pool_domain" {
  description = "The domain prefix to use for the Cognito domain (must be globally unique)"
  type        = string
  default     = ""
}
