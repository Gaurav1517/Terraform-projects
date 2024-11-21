
# Output IAM User Passwords
output "user_passwords" {
  description = "Passwords for the created IAM users"
  value = { 
    for idx, user in aws_iam_user.iam_users :
    user.name => aws_iam_user_login_profile.iam_user_password[idx].password
  }
  sensitive = true
}
