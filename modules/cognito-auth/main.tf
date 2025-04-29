resource "aws_cognito_user_pool" "this" {
  name = var.user_pool_name

  auto_verified_attributes = ["email"]
  alias_attributes         = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  admin_create_user_config {
    allow_admin_create_user_only = false
  }

  mfa_configuration = "OFF"
}

resource "aws_cognito_user_pool_client" "this" {
  name         = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.this.id

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
  ]

  generate_secret = false

  callback_urls = var.callback_urls
  logout_urls   = var.logout_urls

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                = ["email", "openid", "profile"]
  supported_identity_providers        = ["COGNITO"]
}

resource "aws_cognito_user_pool_domain" "this" {
  count        = var.create_user_pool_domain ? 1 : 0
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.this.id
}
