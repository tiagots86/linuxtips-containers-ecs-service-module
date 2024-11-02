data "aws_alb" "main" {
  count = var.use_alb ? 1 : 0
  arn   = var.alb_arn
}