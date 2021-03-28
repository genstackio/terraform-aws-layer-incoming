output "incoming_bucket_arn" {
  value = aws_s3_bucket.incoming.arn
}
output "incoming_bucket_name" {
  value = aws_s3_bucket.incoming.id
}
output "incoming_user_name" {
  value = aws_iam_user.incoming.name
}
output "incoming_user_arn" {
  value = aws_iam_user.incoming.arn
}
output "incoming_user_aki" {
  value = aws_iam_access_key.key.id
}
output "incoming_user_sak" {
  value = aws_iam_access_key.key.secret
}