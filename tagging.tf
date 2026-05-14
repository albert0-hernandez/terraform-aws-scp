

data "aws_organizations_organization" "org" {}

resource "aws_organizations_policy" "tagging" {
  name    = var.tag_policy_name
  content = templatefile("${path.module}/compliance/tags.yml.tftpl", var.compliance)

  type = "TAG_POLICY"
}

resource "aws_organizations_policy_attachment" "tagging_attachment_root" {
  count = var.org_root_attch ? 1 : 0

  policy_id = aws_organizations_policy.tagging.id
  target_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy_attachment" "tagging_attachment_ous" {
  for_each = toset(var.org_ous_attch)

  policy_id = aws_organizations_policy.tagging.id
  target_id = each.value
}



locals {
  _required_tags_map = { for index, v in keys(var.compliance.tags.entries) : "tag${index + 1}Key" => v }
}

resource "aws_config_config_rule" "required_tags" {
  name = "required-tags"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  input_parameters = jsonencode(local._required_tags_map)
}
