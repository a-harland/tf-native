resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "Service Account Name"
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/storage.objectViewer"

  members = [
    "user:asa.harland@e.lloydsbanking.com",
  ]
}
