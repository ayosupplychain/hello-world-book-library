# Design Specification Document

## Project Overview
The **Hello World Book Library** project is a static web application designed to showcase an online bookstore. It uses Docker for containerization, Terraform for infrastructure provisioning, and GitHub Actions for CI/CD workflows. The project is structured to deploy a static web page and manage its infrastructure on Azure.

---

## 1. Frontend Design

### HTML
- **File**: `docker/content/index.html`
- **Purpose**: Serves as the main entry point for the static web page.
- **Key Features**:
  - Includes a header with an image and title.
  - Dynamically populates a grid of books using JavaScript.
  - Links to external stylesheets and fonts for enhanced design.

### CSS
- **File**: `docker/content/styles.css`
- **Purpose**: Provides styling for the static web page.
- **Key Features**:
  - Responsive design using CSS Grid for the book grid layout.
  - Styled header with a shadow effect and a flexible layout.
  - Book cards with hover effects and consistent spacing.

### JavaScript
- **File**: `docker/content/scripts/books.js`
- **Purpose**: Dynamically generates book cards on the web page.
- **Key Features**:
  - Contains an array of book objects with title, author, and thumbnail.
  - Dynamically appends book cards to the DOM using JavaScript.

---

## 2. Backend Design

### Docker
- **File**: `Dockerfile`
- **Purpose**: Defines the containerization process for the static web page.
- **Key Features**:
  - Uses the `nginx:alpine` base image for lightweight deployment.
  - Copies the static content from `docker/content` to the NGINX default directory.

---

## 3. Infrastructure Design

### Terraform
- **Files**: 
  - `terraform/tf-azure/main.tf`
  - `terraform/tf-azure/variables.tf`
- **Purpose**: Manages the deployment of the application infrastructure on Azure.
- **Key Features**:
  - **Providers**:
    - Docker: Manages Docker images and containers.
    - GitHub: Integrates with GitHub for authentication and repository management.
    - AzureRM: Provisions Azure resources.
  - **Resources**:
    - `docker_image`: Builds and pushes the Docker image to the registry.
    - `docker_container`: Runs the Docker container locally.
    - `azurerm_container_group`: Deploys the container to Azure Container Instances (ACI).
  - **Variables**:
    - Configurable parameters for Docker registry, GitHub credentials, and environment names.

---

## 4. CI/CD Workflow Design

### GitHub Actions
- **File**: `terraform/expected-result.yaml`
- **Purpose**: Automates the build, push, and deployment process.
- **Key Features**:
  - **Build Job**:
    - Builds and pushes the Docker image to GitHub Container Registry.
    - Uses QEMU and Buildx for multi-platform builds.
  - **Terraform Job**:
    - Initializes and applies Terraform configurations.
    - Deploys the container to Azure with environment-specific configurations.

---

## 5. Documentation

### README
- **File**: `README.md`
- **Purpose**: Provides an overview of the project and instructions for deployment.
- **Key Features**:
  - Step-by-step guide for setting up GitHub Pages.
  - Instructions for configuring and deploying the static web page.
  - Directory structure explanation.

---

## 6. Static Assets

### Images
- **Directory**: `docker/content/images/`
- **Purpose**: Contains image assets for the web page.
- **Key Features**:
  - Includes a header image (`autumn.jpg`) for the main page.

---

## 7. Fonts

### Source
- **Source**: Google Fonts
- **Purpose**: Enhances the typography of the web page.
- **Key Features**:
  - Uses the `Playfair Display` font for headers.

---

## 8. Environment Variables

### Terraform Variables
- **File**: `terraform/tf-azure/variables.tf`
- **Purpose**: Centralizes configuration for Terraform scripts.
- **Key Variables**:
  - `docker_registry_address`: Address of the Docker registry.
  - `docker_registry_username`: Username for the Docker registry.
  - `docker_image_name`: Name of the Docker image.
  - `github_owner`: GitHub repository owner.
  - `github_token`: GitHub personal access token.
  - `environment_name`: Name of the deployment environment.

### GitHub Actions Environment
- **File**: `terraform/expected-result.yaml`
- **Purpose**: Defines environment variables for CI/CD workflows.
- **Key Variables**:
  - `DOCKER_REGISTRY`: Docker registry address.
  - `DOCKER_IMAGE`: Name of the Docker image.

---

## 9. Deployment Workflow

### Local Deployment
1. Build the Docker image using the `Dockerfile`.
2. Run the container locally using Docker.

### Cloud Deployment
1. Push the Docker image to GitHub Container Registry.
2. Use Terraform to provision Azure resources and deploy the container.

---

## 10. Future Enhancements
- Add more books to the JavaScript array for a richer catalog.
- Implement search and filter functionality for the book grid.
- Enhance the CI/CD pipeline with automated tests for the static web page.
- Add monitoring and logging for the Azure Container Instance.

---

This design specification provides a comprehensive overview of the project structure, components, and workflows. It serves as a guide for development, deployment, and future enhancements.