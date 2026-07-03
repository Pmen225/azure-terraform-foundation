
resource "azurerm_storage_account" "Storage1" {
  name                     = "jrstorageaccount12345"
  resource_group_name      = "RG1"
  location                 = "Uk South"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

