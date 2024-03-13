variable "env" {
  description = "Name of the environment to deploy"
  type        = string
}

variable "prefix" {
  description = "Transformation Engine prefix"
  type        = string
}

variable "tre_permission_boundary_arn" {
  description = "ARN of the TRE permission boundary policy"
  type        = string
}

variable "tre_support_user_roles" {
  description = "ARNs of roles used for AWS console debugging of the TRE system"
  type        = list(string)
}

variable "kms_key_administration_role" {
  description = "Role to administer kms keys"
  type        = string
}

variable "account_id" {
  description = "Account ID for logs being copied in"
  type        = string
}
