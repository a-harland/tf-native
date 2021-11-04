resource "google_pubsub_topic" "notifications" {
  name = "spi-notification-topic-${var.name}"
}

resource "google_pubsub_topic_iam_member" "member" {
  project = var.project_id
  topic   = resource.google_pubsub_topic.notifications.id
  role    = "roles/pubsub.publisher"
  member  = var.publisher_sa
}
