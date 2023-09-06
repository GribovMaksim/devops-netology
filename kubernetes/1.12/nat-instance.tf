resource "yandex_compute_instance" "nat-instance" {
  count = 1
  name  = "nat-instance-${count.index}"
  zone  = "ru-central1-a"
  allow_stopping_for_update = true
  platform_id = "standard-v2"
  hostname = "nat-instance-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      type     = "network-hdd"
      size     = "30"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public-subnet-a.id
    ip_address = "192.168.10.254"
    nat        = true
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_ed25519.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
