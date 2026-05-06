

resource "aws_organizations_policy" "tagging" {
  name    = var.tag_policy_name
  content = templatefile("${path.module}/compliance/tags.yml.tftpl", var.compliance)

  type = "TAG_POLICY"
}

resource "aws_organizations_policy_attachment" "tagging" {
  policy_id = aws_organizations_policy.tagging.id
  target_id = var.organization_id
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