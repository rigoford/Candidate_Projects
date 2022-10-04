# Locals for use across all terraform resources
resource "random_string" "uuid" {
  length  = 6
  special = false
}

locals {
  random_id       = lower(random_string.uuid.id)
  project_name    = "assessment-${var.candidate_number}"
  project_id      = "${local.project_name}-${local.random_id}"
  candidate_email = "candidate${var.candidate_number}@${var.organisation_domain}"
}