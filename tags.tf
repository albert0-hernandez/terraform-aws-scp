

resource "aws_organizations_policy" "tags" {
  name    = "tag-policy-example"
  content = templatefile("${path.module}/compliance/tags.yml.tmpl", var.compliance)
  type    = "TAG_POLICY"
}

resource "aws_organizations_policy_attachment" "tags" {
  policy_id = aws_organizations_policy.tags.id
  target_id = var.organization_id
}


locals {
  _required_tags_map = { for index, v in var.compliance.tags : "tag${index}Key" => v }
}

resource "aws_config_config_rule" "required_tags" {
  name = "required-tags"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  input_parameters = jsonencode(local._required_tags_map)

  scope {
    compliance_resource_types = [
      "AWS::ECR::*",
    ]
  }
}