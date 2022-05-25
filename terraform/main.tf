terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

provider "google" {
  project = "diamond-62188"
  region  = "europe-west2"
}

module "service_account" {
  source = "./modules/service_account"
}

module "gke" {
  source = "./modules/gke"
  depends_on = [
    module.service_account
  ]

  name   = var.name
  region = var.region
}
