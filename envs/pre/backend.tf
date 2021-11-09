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

data "terraform_remote_state" "project" {
  backend = "remote"
  config = {
    organization = "harland"
    workspaces = {
      name = "tf-native-project-tst"
    }
  }
}

provider "google" {
  project = "blue-dog-piano"
}

provider "google-beta" {
  project = "blue-dog-piano"
}