variable "docker_registry_address" {
  description = "The address of the Docker registry"
  type        = string
}

variable "docker_registry_username" {
  description = "The username for the Docker registry"
  type        = string
}

variable "docker_image_name" {
  description = "The name of the Docker image"
  type        = string
}

variable "github_owner" {
  description = "The GitHub repository owner"
  type        = string
}

variable "github_token" {
  description = "The GitHub personal access token"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}
