resource "yandex_compute_instance" "public-instance" {
  count = 1
  name  = "public-${count.index}"
  zone  = "ru-central1-a"
  allow_stopping_for_update = true
  platform_id = "standard-v2"
  hostname = "public-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8oshj0osht8svg6rfs"
      type     = "network-hdd"
      size     = "30"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public-subnet-a.id
    nat       = true
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_ed25519.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }
}
