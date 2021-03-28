locals {
  user_name = (null != var.user_name) ? var.user_name : "${var.env}-incoming"
}