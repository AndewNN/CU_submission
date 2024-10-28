terraform {
   required_providers {
      docker = {
         source = "kreuzwerker/docker"
         version = "~> 2.21.0"
      }
   }
}

provider "docker" {}
resource "docker_network" "todo_network" {
   name = "todo_network"
}

resource "docker_image" "todo" {
   name = "todo:release-3"
   build {
      path = "./todo"
   }
}

resource "docker_image" "redis"{
   name = "redis"
}

resource "docker_container" "todo" {
   name = "todo"
   image = docker_image.todo.name
   networks_advanced {
      name = docker_network.todo_network.name
   }
   env = ["REDIS_HOST=redis"]
   ports {
      internal = 8000
      external = 80
   }
   depends_on = [docker_network.todo_network,docker_container.redis]
}

resource "docker_container" "redis" {
   name = "redis"
   image = docker_image.redis.name
   networks_advanced {
      name = docker_network.todo_network.name
   }
   ports {
      internal = 6379
      external = 6379
   }
   depends_on = [docker_network.todo_network]
}
