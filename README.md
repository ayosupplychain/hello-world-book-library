# Static Web Page Template

This repository serves as a **template** for creating and deploying static web pages using **GitHub Actions** and **GitHub Pages**. It is designed as a **GitHub Actions challenge lab** to help you practice setting up workflows and deploying static content.

## Overview
The repository contains a static web page located in the `docker/content` directory. The goal is to deploy this content to GitHub Pages using a GitHub Actions workflow.

## GitHub Actions Challenge Lab
Follow the steps below to create a repository from this template and deploy the static content using GitHub Pages.

### Step 1: Create a Repository from the Template
1. Click the **"Use this template"** button on the repository page.
2. Select **"Create a new repository"**.
3. Provide a name for your new repository and click **"Create repository from template"**.

### Step 2: Set Up GitHub Pages
1. Go to the **Settings** tab of your new repository.
2. Scroll down to the **Pages** section.
3. Under **Source**, select **GitHub Actions** as the deployment method and choose `Static HTML` from the suggested workflows below.
  ![screenshot](/doc-images/screenshot-static-html.png)
4. Select Configure. This will pre-populate a new YAML file that will look like this:
```yaml
# Simple workflow for deploying static content to GitHub Pages
name: Deploy static content to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # Single deploy job since we're just deploying
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v5
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          # Upload entire repository
          path: '.'
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4

```

### Step 3: Configure GitHub Actions Workflow
1. Configure the workflow to upload the contents of the `docker/content` directory _(feel free to use Copilot)_.

2. Commit and push the workflow file to the `main` branch.

### Step 4: Verify Deployment
1. After the workflow runs successfully, go to the **Settings** tab.
2. Under **Pages**, you should see the URL where your static site is deployed.
3. Visit the URL to verify that the content from the `docker/content` directory is displayed.

## Directory Structure
- `docker/content/`: Contains the static web page files, including `index.html`, `styles.css`, and assets like images and scripts.
  - `index.html`: The main HTML file.
  - `styles.css`: The CSS file for styling.
  - `images/`: Directory containing image assets.
  - `scripts/`: Directory containing JavaScript files.

## License
This project is licensed under the MIT License.