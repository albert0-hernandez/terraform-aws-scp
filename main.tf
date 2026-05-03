
resource "aws_organizations_organization" "main" {
  feature_set = "ALL"

  enabled_policy_types = [
    "TAG_POLICY",
    "SERVICE_CONTROL_POLICY",
  ]
}
