# Create IAM Policies and Assign this to the devloper gruop

resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = "Policy to allow describing VPC subnets"
  tags = {
    Name = "${var.policy_name}-TF"
  }
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcs"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to Group
resource "aws_iam_group_policy_attachment" "attach_policy" {
  group      = aws_iam_group.dev_group.name
  policy_arn = aws_iam_policy.policy.arn
}
