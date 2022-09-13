terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.21.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "node-app" {
  name         = var.docker_image
  keep_locally = false
}

resource "docker_container" "node-app" {
  image = docker_image.generic-node-app.latest
  name  = var.container_name
  ports {
    internal = 7080
    external = 8080
  }
}

output "container_name" {
  value = docker_container.node-app.name
}
