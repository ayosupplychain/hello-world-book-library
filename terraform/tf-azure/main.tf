terraform {
  backend "azurerm" {
    resource_group_name  = "oh-my-world"
    storage_account_name = "ayonnginxhelloworld"
    container_name       = "wtf"
    key                  = "terraform.tfstate"
  }

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  registry_auth {
    address  = var.docker_registry_address
    username = var.docker_registry_username
    password = var.github_token
  }
  # Configuration options
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

provider "azurerm" {
  features {}
}

resource "docker_image" "helloworld" {
  name         = "${var.docker_registry_address}/${var.github_owner}/${var.docker_image_name}:latest"
  keep_locally = false
}

resource "docker_container" "helloworld" {
  image = docker_image.helloworld.latest
  name  = "helloworld_container"

  ports {
    internal = 80
    external = 8080
  }
}

resource "azurerm_container_group" "aci_helloworld" {
  name                = "aci-helloworld"
  location            = "Australia East"
  resource_group_name = "oh-my-world"
  os_type             = "Linux"

  dns_name_label = "${var.environment_name}-aci-helloworld-dns" // Added DNS name label

  container {
    name   = "helloworld"
    image  = "${var.docker_registry_address}/${var.github_owner}/${var.docker_image_name}:latest"
    cpu    = "1.0"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  image_registry_credential {
    server   = var.docker_registry_address
    username = var.github_owner
    password = var.github_token
  }

  tags = {
    environment = var.environment_name
  }
}
