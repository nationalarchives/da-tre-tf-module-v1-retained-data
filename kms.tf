module "v1_retained_data_bucket_kms_key" {
  source = "github.com/nationalarchives/da-terraform-modules//kms?ref=5ec89e8"
  key_name = "${var.env}-${var.prefix}-v1-retained-data-kms"
  tags = {}
  default_policy_variables = {
    user_roles = var.tre_support_user_roles
    service_details = [{service_name = "logs.eu-west-2"}]
  }
  permissions_boundary = var.tre_permission_boundary_arn
}
