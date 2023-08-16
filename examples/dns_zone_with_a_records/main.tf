provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name = "rg-terraform-northeu-001"
  location = "northeurope"
}

module "dns_zone_with_a_records" {
  source = "../../"
  resource_group_name = azurerm_resource_group.this.name

  dns_zone_name = "example.com"
  
  a_records = [
    {
        name = "Record1"
        ttl = 300
        records = ["123.123.123.123"]
    },
    {
        name = "Record2"
        ttl = 300
        records = ["111.111.111.111", "111.112.222.222"]
    }
  ]
}

output "Record1" {
  value = module.dns_zone_with_a_records.a_records["Record1"]
}