locals {
  labels = {
    owner              = "a-harland"
    troux_id           = "troux"
    cost_centre        = "cc"
    dataclassification = "limited"
    cmdb_id            = "234089"
  }

  min_node_count    = 1
  max_node_count    = 5
  machine_type      = "n1-standard-2"
  cluster_disk_size = 200
}

module "iam" {
  source               = "../../modules/iam"
  project_id           = data.terraform_remote_state.project.outputs.project_id
  service_account_name = "spi-editor"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "access_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "europe-west2"
  default_table_expiration_ms = 3600000

  labels = {
    owner              = "a-harland"
    troux_id           = "troux"
    cost_centre        = "cc"
    dataclassification = "limited"
    cmdb_id            = "234089"
  }
}
