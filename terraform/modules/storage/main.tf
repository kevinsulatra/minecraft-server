resource "google_compute_disk" "minecraft" {
  name  = var.name
  type  = "pd-standard"
  zone  = "${var.region}-a"
}
