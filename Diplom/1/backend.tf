terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "diplom-terraform"
    key        = "diplom/terraform.tfstate" # path to my tfstate file in the bucket
    region     = "ru-central1-a"
    access_key = "${var.key_id}"
    secret_key = "${var.secret_key}"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
