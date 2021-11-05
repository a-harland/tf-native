resource "google_pubsub_topic" "notifications" {
  project = var.project_id
  name    = "spi-notification-topic-${var.name}"
  labels  = {
      cmdb_id = "al12345"
  }
}

resource "google_pubsub_topic_iam_member" "member" {
  project = var.project_id
  topic   = resource.google_pubsub_topic.notifications.id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${var.publisher_sa}"
}

resource "google_pubsub_topic" "notifications_no_label" {
  project = var.project_id
  name    = "spi-notification-no-label-${var.name}"
}