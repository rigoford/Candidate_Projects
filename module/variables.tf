# Variables
variable "terraform_service_account_email" {
  description = "Email address of the Terraform Service Account to impersonate when applying"
}

variable "organisation_id" {
  description = "Id of the GCP Organisation projects will be created in"
  type        = string
}

variable "billing_account_id" {
  description = "Id of the Billing Account projects and resources will be charged to"
  type        = string
}

variable "organisation_domain" {
  description = "Organisation Domain, e.g. example.com"
  type        = string
}

variable "candidate_number" {
  description = "Candidate user account suffix"
  type        = string
}

variable "assessors" {
  description = "List of accessor users accounts"
  type        = list(string)
}

variable "region" {
  default = "europe-west1"
  type    = string
}

variable "zone" {
  default = "europe-west1-b"
  type    = string
}