# resource "google_compute_disk" "minecraft" {
  
# }

resource "google_container_cluster" "minecraft" {
  name     = var.name
  location = "${var.region}-a"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

data "google_service_account" "minecraft" {
  account_id = google_container_cluster.minecraft.name
}

resource "google_container_node_pool" "minecraft_preemptible_nodes" {
  name       = google_container_cluster.minecraft.name
  location   = google_container_cluster.minecraft.location
  cluster    = google_container_cluster.minecraft.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-standard-2"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = data.google_service_account.minecraft.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
