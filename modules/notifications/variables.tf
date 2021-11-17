variable "project_id" {
  description = "GCP Project ID."
}

variable "name" {
  description = "Name of the value stream creating the notifications topic."
  validation {
    condition     = can(regex("(^[[:alnum:]]+-[[:alnum:]]+-[[:alnum:]]+-[[:alnum:]]+-[[:alnum:]]+-[[:alnum:]]+-[[:alnum:]]+)", var.name))
    error_message = "The name should match the following format name: [valuestream|platformengineering]-[workstream]-[env]-[resource]-[location]-[description]-[suffix]."
  }
}

variable "publisher_sa" {
  description = "Service account used for publishing messages."
}