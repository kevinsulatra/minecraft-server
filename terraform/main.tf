terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

provider "google" {
 project = "diamond-62188"
 region  = "europe-west2"
}
