locals {
  project_id     = "blue-dog-piano"
  project_number = "8998239489"
  env            = "pre"
  region         = "europe-west2"
  kms_project_id = "kms-project-id"
  kms_key_ring   = "kms-eu-mgmt"
  kms_crypto_key = "kms-key"

  labels = {
    owner              = "a-harland"
    troux_id           = "troux"
    cost_centre        = "cc"
    dataclassification = "limited"
    cmdb_id            = "234089"
  }

  min_node_count    = 3
  max_node_count    = 20
  machine_type      = "n1-standard-2"
  cluster_disk_size = 200
}

module "iam" {
  source               = "../../modules/iam"
  service_account_name = "spi-service-account"
}

module "notification" {
  source       = "../../modules/notifications"
  project_id   = local.project_id
  name         = "ccf"
  publisher_sa = module.iam.service_account_email
}

module "spinnaker_euw1" {
  source             = "../../modules/spinnaker"
  name               = "spi-euw1"
  project_id         = local.project_id
  env                = local.env
  region             = "europe-west1"
  kms_project_id     = local.project_id
  kms_key_ring       = "kms-eu-mgmt"
  kms_crypto_key     = "kms-key"
  service_project_id = "service-project"

  min_node_count    = local.min_node_count
  max_node_count    = local.max_node_count
  machine_type      = local.machine_type
  cluster_disk_size = local.cluster_disk_size

  labels = local.labels
}

module "spinnaker_euw1" {
  source             = "../../modules/spinnaker"
  name               = "spi-euw1"
  project_id         = local.project_id
  env                = local.env
  region             = "europe-west2"
  kms_project_id     = local.project_id
  kms_key_ring       = "kms-eu-mgmt"
  kms_crypto_key     = "kms-key"
  service_project_id = "service-project"

  min_node_count    = local.min_node_count
  max_node_count    = local.max_node_count
  machine_type      = local.machine_type
  cluster_disk_size = local.cluster_disk_size

  labels = local.labels
}