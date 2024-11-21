variable "username" {
  type        = list(string)
  default     = ["dev", "test", "prod"]
  description = "List of IAM users to create."
}

variable "group_name" {
  type        = string
  default     = "developer"
  description = "Name of the IAM group."
}

variable "policy_name" {
  type        = string
  default     = "devPolicy"
  description = "Name of the IAM policy."
}
variable "allow_pass_change" {
  type        = string
  default     = "AllowPasswordChange"
  description = "Name of the IAM policy."
}

