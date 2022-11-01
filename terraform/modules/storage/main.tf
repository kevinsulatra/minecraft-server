resource "google_compute_disk" "minecraft" {
  name = var.name
  type = "pd-standard"
  size = 50
  zone = "${var.region}-a"
}
