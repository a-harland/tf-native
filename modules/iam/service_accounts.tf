resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  display_name = "Service Account"
}

resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:asa.harland@gmail.com",
    ]
  }
}
