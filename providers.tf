terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "azurerm" {
  # Configuration options
  features {

  }
}
provider "aws" {
  region = "us-east-1"
}