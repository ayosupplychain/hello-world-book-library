# oh-my-world
A beautiful Hello World app with a resized home page 🚀

## Overview
This project is a simple Hello World application using Nginx and Docker, managed with Terraform.

**Production Website:** [http://aci-helloworld-dns.australiaeast.azurecontainer.io/](http://aci-helloworld-dns.australiaeast.azurecontainer.io/)

## Prerequisites
- Docker
- Terraform

## Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/oh-my-world.git
   cd oh-my-world
   ```

2. Initialize Terraform:
   ```sh
   terraform init
   ```

3. Apply the Terraform configuration:
   ```sh
   terraform apply
   ```

## Docker
The Dockerfile sets up an Nginx server to serve static content.

## Terraform
The Terraform configuration manages the Docker provider to build and run the Docker container.

## License
This project is licensed under the MIT License.
