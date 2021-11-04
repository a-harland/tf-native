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

provider "google" {
  project = "blue-dog-piano"
}

provider "google-beta" {
  project = "blue-dog-piano"
}

locals {
  project_id = "blue-dog-piano"
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
