

data "aws_iam_policy_document" "this" {
  for_each = local.service_control_policies

  statement {
    sid         = each.value.sid
    effect      = each.value.effect
    actions     = try(each.value.actions, null)
    not_actions = try(each.value.not_actions, null)
    resources   = each.value.resources

    dynamic "condition" {
      for_each = try(each.value.condition, null) != null ? each.value.condition : []

      content {
        test     = condition.value.test
        variable = condition.value.variable
        values   = condition.value.values
      }
    }
  }
}


resource "aws_organizations_policy" "this" {
  for_each = local.service_control_policies

  name     = each.value.sid
  content  = data.aws_iam_policy_document.this[each.value.sid].json
}


resource "aws_organizations_policy_attachment" "this" {
  for_each = aws_organizations_policy.this

  policy_id = each.value.id
  target_id = var.organization_id
}