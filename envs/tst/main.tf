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
    env = "default"
  }
}

# module "notification" {
#   source       = "../../modules/notifications"
#   project_id   = data.terraform_remote_state.project.outputs.project_id
#   name         = "pe-ws-tst-psb-euwe2-desc-01"
#   publisher_sa = module.iam.service_account_email
# }

# module "spinnaker_euw1" {
#   source             = "../../modules/spinnaker"
#   name               = "spi-euw1"
#   project_id         = data.terraform_remote_state.project.outputs.project_id
#   env                = data.terraform_remote_state.project.outputs.env
#   region             = "europe-west1"
#   kms_project_id     = data.terraform_remote_state.project.outputs.kms_project_id
#   kms_key_ring       = data.terraform_remote_state.project.outputs.kms_key_ring
#   kms_crypto_key     = data.terraform_remote_state.project.outputs.kms_crypto_key
#   service_project_id = "service-project"

#   min_node_count    = local.min_node_count
#   max_node_count    = local.max_node_count
#   machine_type      = local.machine_type
#   cluster_disk_size = local.cluster_disk_size

#   labels = local.labels
# }
