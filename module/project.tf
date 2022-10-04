# Project
resource "google_project" "project" {
  name                = local.project_name
  project_id          = local.project_id
  org_id              = var.organisation_id
  billing_account     = var.billing_account_id
  auto_create_network = false

  provisioner "local-exec" {
    command = "sleep 60"
  }
}

# Enable services
resource "google_project_service" "bigquery" {
  project                    = google_project.project.project_id
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloudbuild" {
  project                    = google_project.project.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloudfunctions" {
  project                    = google_project.project.project_id
  service                    = "cloudfunctions.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "compute" {
  project                    = google_project.project.project_id
  service                    = "compute.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "logging" {
  project                    = google_project.project.project_id
  service                    = "logging.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "oslogin" {
  project                    = google_project.project.project_id
  service                    = "oslogin.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "sourcerepo" {
  project                    = google_project.project.project_id
  service                    = "sourcerepo.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "stackdriver" {
  project                    = google_project.project.project_id
  service                    = "stackdriver.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "storage" {
  project                    = google_project.project.project_id
  service                    = "storage.googleapis.com"
  disable_dependent_services = true
}

# Enable OS Login
resource "google_compute_project_metadata_item" "enable_oslogin" {
  project = google_project.project.project_id
  key     = "enable-oslogin"
  value   = true
}

# Project IAM
resource "google_project_iam_member" "assessor_viewer" {
  for_each = toset(var.assessors)
  project  = google_project.project.project_id
  role     = "roles/viewer"
  member   = "user:${each.key}"
}

resource "google_project_iam_member" "assessor_storage_objectCreator" {
  for_each = toset(var.assessors)
  project  = google_project.project.project_id
  role     = "roles/storage.objectCreator"
  member   = "user:${each.key}"
}

resource "google_project_iam_member" "candidate_bigquery_admin" {
  project = google_project.project.project_id
  role    = "roles/bigquery.admin"
  member  = "user:${local.candidate_email}"
}

resource "google_project_iam_member" "candidate_cloudfunctions_admin" {
  project = google_project.project.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "user:${local.candidate_email}"
}

resource "google_project_iam_member" "candidate_logging_viewer" {
  project = google_project.project.project_id
  role    = "roles/logging.viewer"
  member  = "user:${local.candidate_email}"
}

resource "google_project_iam_member" "candidate_pubsub_admin" {
  project = google_project.project.project_id
  role    = "roles/pubsub.admin"
  member  = "user:${local.candidate_email}"
}

resource "google_project_iam_member" "candidate_storage_admin" {
  project = google_project.project.project_id
  role    = "roles/storage.admin"
  member  = "user:${local.candidate_email}"
}

resource "google_project_iam_member" "candidate_service_account_admin" {
  project = google_project.project.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "user:${local.candidate_email}"
}