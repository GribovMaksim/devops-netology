resource "yandex_iam_service_account" "master" {
  folder_id = var.yc_folder_id
  name  = "master"
}

resource "yandex_iam_service_account" "puller" {
  folder_id = var.yc_folder_id
  name  = "puller"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "master-editor" {                                                          
  folder_id = var.yc_folder_id
  role  = "editor"
  member  = "serviceAccount:${yandex_iam_service_account.master.id}"                                                           
}

resource "yandex_container_registry_iam_binding" "puller" {
  registry_id = "${yandex_container_registry.diplom.id}"
  role        = "editor"
  members = ["serviceAccount:${yandex_iam_service_account.puller.id}"]
}