# Policy to allow password change for IAM users
resource "aws_iam_policy" "allow_password_change" {
  name        = var.allow_pass_change
  description = "Allows IAM users to change their own password"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "iam:ChangePassword"
        Resource = "arn:aws:iam::*:user/*"
      }
    ]
  })
}

# Attach the policy to the group
resource "aws_iam_group_policy_attachment" "attach_password_policy" {
  group      = aws_iam_group.dev_group.name
  policy_arn = aws_iam_policy.allow_password_change.arn
}
