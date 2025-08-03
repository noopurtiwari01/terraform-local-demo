# main.tf
terraform {
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "~> 3.0.2"
        }
    }
}

# Configure the Docker provider
provider "docker" {}

resource "docker_image" "nginx" {
    name = "nginx:latest"
}

resource "docker_container" "nginx" {
    name = "nginx_container"
    image = docker_image.nginx.name
    ports {
        internal = 80
        external = 8080
    }
}

# terraform destroy will delete the container and image both.