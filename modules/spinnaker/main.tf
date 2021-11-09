module "spinnaker" {
  source         = "../_pe_modules/tf-mod-spinnaker"
  project_id     = var.project_id
  env            = var.env
  region         = var.region
  kms_project_id = var.kms_project_id
  kms_key_ring   = var.kms_key_ring
  kms_crypto_key = var.kms_crypto_key
  name           = var.name

  min_node_count     = var.min_node_count
  max_node_count     = var.max_node_count
  machine_type       = var.machine_type
  cluster_disk_size  = 200
  service_project_id = var.service_project_id

  labels = var.labels
}