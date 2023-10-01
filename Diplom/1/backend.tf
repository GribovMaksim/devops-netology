terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "diplom-terraform"
    key        = "diplom/terraform.tfstate" # path to my tfstate file in the bucket
    region     = "ru-central1-a"
    access_key = "YCAJEKO5d36keESEN3y_hIVQ4"
    secret_key = "YCN5ZkXas-AhG7eZ70DB7Ikbsiaa3DY5sW7Nw-dA"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}