resource "yandex_container_registry" "diplom" {
  name      = "netology"
  folder_id = var.yc_folder_id

  labels = {
    my-label = "diplom-apps"
  }
}