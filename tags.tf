

resource "aws_organizations_policy" "tags" {
  name    = "tag-policy-example"
  content = templatefile("${path.module}/compliance/tags.yml.tmpl", var.compliance)
  type    = "TAG_POLICY"
}

resource "aws_organizations_policy_attachment" "tags" {
  policy_id = aws_organizations_policy.tags.id
  target_id = var.organization_id
}