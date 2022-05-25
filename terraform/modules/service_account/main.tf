resource "google_service_account" "sa" {
  account_id   = "minecraft"
  display_name = "minecraft"
}

resource "google_service_account_iam_binding" "sa" {
  service_account_id = google_service_account.sa.name
  role               = "roles/owner"

  members = ["serviceAccount:minecraft@diamond-62188.iam.gserviceaccount.com"]
}
