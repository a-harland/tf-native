variable "project_id" {
  description = "GCP Project ID."
}

variable "name" {
  description = "Name of the value stream creating the notifications topic."
}

variable "publisher_sa" {
  description = "Service account used for publishing messages."
}