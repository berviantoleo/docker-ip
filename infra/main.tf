terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "bervproject"

    workspaces {
      name = "app-runner"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}


resource "aws_apprunner_service" "docker_ip" {
    service_name = "docker-ip"
    source_configuration {
        image_repository {
            image_configuration {
                port = "80"
            }
            image_identifier = "public.ecr.aws/nginx/nginx:1.24-alpine-slim"
            image_repository_type = "ECR_PUBLIC"
        }
        auto_deployments_enabled = false
    }
}