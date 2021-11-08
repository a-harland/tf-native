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
