module "v1_retained_data_bucket_kms_key" {
  source = "github.com/nationalarchives/da-terraform-modules//kms?ref=9518c81"
  key_name = "${var.env}-${var.prefix}-v1-retained-data-kms"
  tags = {}
  default_policy_variables = {
    user_roles = var.tre_support_user_roles
    ci_roles = [var.kms_key_administration_role]
    service_names = ["cloudwatch"]
  }
  permissions_boundary = var.tre_permission_boundary_arn
}
