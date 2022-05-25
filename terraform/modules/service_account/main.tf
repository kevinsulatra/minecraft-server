resource "google_service_account" "sa" {
  account_id   = "minecraft"
  display_name = "minecraft"
}

resource "google_service_account_iam_member" "sa" {
  service_account_id = google_service_account.sa.name
  role               = "roles/owner"

  member = "serviceAccount:$(google_service_account.sa.email)"
}
