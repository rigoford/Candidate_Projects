resource "google_storage_bucket" "sample_data" {
  project                     = google_project.project.project_id
  name                        = "sample-data-${local.random_id}"
  location                    = var.region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "sample_data" {
  count  = 10
  name   = "mock_data_${count.index}.csv"
  source = "./data/mock_data_${count.index}.csv"
  bucket = google_storage_bucket.sample_data.name
}

resource "google_storage_bucket" "source_code" {
  project                     = google_project.project.project_id
  name                        = "source-code-${local.random_id}"
  location                    = var.region
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "source_code" {
  name   = "source-code.zip"
  source = "./src/source-code.zip"
  bucket = google_storage_bucket.source_code.name
}