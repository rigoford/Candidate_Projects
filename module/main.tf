terraform {
  required_version = "1.1.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.15.0"
    }
  }
}

provider "google" {
  impersonate_service_account = var.terraform_service_account_email
}