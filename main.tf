resource "aws_s3_bucket" "incoming" {
  bucket = var.bucket_name
  acl    = "private"
}
resource "aws_s3_bucket_notification" "incoming-to-lambda" {
  bucket = aws_s3_bucket.incoming.id
  lambda_function {
    lambda_function_arn = module.lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
resource "aws_lambda_permission" "incoming-to-lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.incoming.arn
}

module "lambda" {
  source        = "./modules/lambda"
  name          = "${var.env}-incoming"
  handler       = "index.handler"
  timeout       = 600
  memory_size   = 2048
  policy_statements = concat([
    {
      actions   = ["s3:ListBucket"]
      resources = [aws_s3_bucket.incoming.arn]
      effect    = "Allow"
    },
    {
      actions   = ["s3:GetObject", "s3:Put*", "s3:GetObjectTagging", "s3:DeleteObject*"]
      resources = ["${aws_s3_bucket.incoming.arn}/*"]
      effect    = "Allow"
    },
  ], var.policy_statements)
  variables          = var.variables
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  config_file        = var.config_file
  plugins_file       = var.plugins_file
  utils_file         = var.utils_file
  providers = {
    aws = aws
  }
}

resource "aws_iam_user" "incoming" {
  name = local.user_name
}

resource "aws_iam_user_policy" "incoming-user-policy" {
  policy = data.aws_iam_policy_document.incoming-user-policy.json
  user   = aws_iam_user.incoming.name
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.incoming.name
}
