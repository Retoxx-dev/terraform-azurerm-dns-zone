provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name = "rg-terraform-northeu-001"
  location = "northeurope"
}

module "dns_zone_with_cname_records" {
  source = "../../"
  resource_group_name = azurerm_resource_group.this.name

  dns_zone_name = "example.com"
  
  cname_records = [
    {
        name = "Record1"
        ttl = 300
        record = "example2.com"
    }
  ]
}