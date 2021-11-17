resource "google_pubsub_topic" "notifications" {
  project = var.project_id
  name    = var.name
  labels = {
    cmdb_id = "al12345",
    dataclassification = "confidential"
  }
  kms_key_name = google_kms_crypto_key.crypto_key.id
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "example-key"
  key_ring = google_kms_key_ring.key_ring.id
}

resource "google_kms_key_ring" "key_ring" {
  name     = "example-keyring"
  location = "europe-west2"
}

resource "google_pubsub_topic_iam_member" "member" {
  project = var.project_id
  topic   = resource.google_pubsub_topic.notifications.id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${var.publisher_sa}"
}

