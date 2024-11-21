
# Create IAM Users with Password
resource "aws_iam_user" "iam_users" {
  count = length(var.username)
  name  = element(var.username, count.index)
  tags = {
    Name = "${element(var.username, count.index)}-TF"
  }
}

# IAM User Login Profile (for password)
resource "aws_iam_user_login_profile" "iam_user_password" {
  count                   = length(var.username)
  user                    = aws_iam_user.iam_users[count.index].name
  password_reset_required = true

}

#Add a resource to set the password policy if needed:

resource "aws_iam_account_password_policy" "default" {
  minimum_password_length        = 8
  require_symbols                = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  allow_users_to_change_password = true
  hard_expiry                    = false
}

# Create IAM Group
resource "aws_iam_group" "dev_group" {
  name = var.group_name
}

# Adding Users to Group
resource "aws_iam_user_group_membership" "user_group_membership" {
  count  = length(var.username)
  user   = aws_iam_user.iam_users[count.index].name
  groups = [aws_iam_group.dev_group.name]
}



