terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "python_image" {
  name = var.image_name
}

resource "docker_container" "python_container" {
  name  = var.container_name
  image = docker_image.python_image.image_id

  ports {
    internal = 5000
    external = 5000
  }
}