module "terraform_state_bucket" {
  source = "../../modules/s3"

  bucket_name = "mbalach-cloud-native-platform-2026-tfstate"
  environment = "dev"
}