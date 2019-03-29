provider "azurerm" {
    version = "~>1.21.0"
}

terraform {
  required_version = "~> 0.11.11"
  backend "azurerm" {
  }
}

resource "azurerm_resource_group" "rg_core" {
  name = "rg-test-cblt-msft"
  location = "eastus"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault1" {
  name                = "kv1-test-cblt-msft"
  location            = "eastus"
  resource_group_name = "rg-test-cblt-msft"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  depends_on          = ["azurerm_resource_group.rg_core"]

  sku {
    name = "standard"
  }
}

resource "azurerm_key_vault" "keyvault2" {
  name                = "kv2-test-cblt-msft"
  location            = "eastus"
  resource_group_name = "rg-test-cblt-msft"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  depends_on          = ["azurerm_resource_group.rg_core"]

  sku {
    name = "standard"
  }
}