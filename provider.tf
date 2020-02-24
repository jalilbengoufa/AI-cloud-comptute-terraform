provider "google" {
  credentials = file("serviceaccounttf.json")
  project     = "ai-compute-269119"
  region      = "us-east1-b"
}

