output "nat-instance_external_ip_address" {
  value = yandex_compute_instance.nat-instance.*.network_interface.0.nat_ip_address
}

output "public-instance_external_ip_address" {
  value = yandex_compute_instance.public-instance.*.network_interface.0.nat_ip_address
}

output "public-instance_iternal_ip_address" {
  value = yandex_compute_instance.public-instance.*.network_interface.0.ip_address
}

output "private-instance_iternal_ip_address" {
  value = yandex_compute_instance.private-instance.*.network_interface.0.ip_address
}
