resource "yandex_vpc_network" "k8s-network" {
  name = "ya-network"
}

resource "yandex_vpc_subnet" "k8s-network-a" {
  name           = "public-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = ["172.28.0.0/24"]
}
resource "yandex_vpc_subnet" "k8s-network-b" {
  name           = "public-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = ["172.28.10.0/24"]
}
resource "yandex_vpc_subnet" "k8s-network-c" {
  name           = "public-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = ["172.28.20.0/24"]
}