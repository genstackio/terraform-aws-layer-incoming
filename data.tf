data "aws_region" "current" {
}
data "aws_iam_policy_document" "incoming-user-policy" {
  statement {
    actions   = ["s3:Put*", "s3:ListBucket"]
    resources = ["${aws_s3_bucket.incoming.arn}/*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.incoming.arn]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:List*"]
    resources = ["*"]
    effect    = "Allow"
  }
}