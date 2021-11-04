terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    organization = "harland"

    workspaces {
      name = "tf-native-tst"
    }
  }
}

locals {
  project_id = "tf-native"
}

module "iam" {
  source               = "../../modules/iam"
  service_account_name = "spi"
}

module "notification" {
  source       = "../../modules/notifications"
  project_id   = local.project_id
  name         = "ccf"
  publisher_sa = module.iam.service_account_email
}
