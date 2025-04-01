terraform {

  required_providers {

    azurerm = {

      source = "hashicorp/azurerm"

      version = "~> 3.0"

    }

  }

  backend "azurerm" {

    resource_group_name = "suna0011-shar0055-githubactions-rg"

    storage_account_name = "suna0011shar0055"

    container_name = "tfstate"

    key      = "prod.app.tfstate"
    use_oidc = true

  }

  required_version = ">= 1.3.0"

}

provider "azurerm" {

  features {}
  use_oidc = true

}

 