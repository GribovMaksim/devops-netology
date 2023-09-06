resource "yandex_vpc_network" "example_network" {
    name = "example_network"
}

resource "yandex_vpc_subnet" "public-subnet-a" {
    name           = "public"
    zone           = "ru-central1-a"
    network_id     = yandex_vpc_network.example_network.id
    v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_route_table" "routing_table" {
    network_id = yandex_vpc_network.example_network.id

    static_route {
        destination_prefix = "0.0.0.0/0"
        next_hop_address = "192.168.10.254"
    }
}

resource "yandex_vpc_subnet" "private-subnet-a" {
    name           = "private"
    zone           = "ru-central1-a"
    network_id     = yandex_vpc_network.example_network.id
    route_table_id = yandex_vpc_route_table.routing_table.id
    v4_cidr_blocks = ["192.168.20.0/24"]
}
