module "lambda" {
  source            = "genstackio/lambda-base/aws"
  version           = "0.1.0"
  name              = var.name
  runtime           = var.runtime
  timeout           = var.timeout
  memory_size       = var.memory_size
  handler           = var.handler
  variables         = var.variables
  publish           = var.publish
  policy_statements = var.policy_statements
  config_file       = var.config_file
  plugins_file      = var.plugins_file
  utils_file        = var.utils_file
  package_file      = "${path.module}/lambda-code.zip"
  code_dir          = "${path.module}/code"
  providers         = {
    aws = aws
  }
}