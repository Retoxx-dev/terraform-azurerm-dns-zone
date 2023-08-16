# terraform-azurerm-dns-zones

## Create a DNS Zone with various type of records in Azure
With this module you can create a DNS Zone in Azure and add various type of records to it. You can specify multiple records of each type.

The following record types are supported: `A`, `AAAA`, `CAA`, `CNAME`, `MX`, `NS`, `PTR`, `SRV`, `TXT`. 

## Usage
Please find the examples in the [examples](examples/) folder.

Each record type has it's respective output variable. For example, in order to access specific A record details, just use the `a_records` output variable with correct `name` key.
```hcl
output "test" {
  value = module.dns_zone_with_a_records.a_records[test"]
}
```
The above will output an object with record data in it.
```
test = {
  + fqdn                = (known after apply)
  + id                  = (known after apply)
  + name                = "test"
  + records             = [
      + "123.123.123.123",
    ]
  + resource_group_name = "rg-terraform-northeu-001"
  + tags                = null
  + target_resource_id  = null
  + timeouts            = null
  + ttl                 = 300
  + zone_name           = "example.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_a_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_aaaa_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_caa_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_caa_record) | resource |
| [azurerm_dns_cname_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_mx_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record) | resource |
| [azurerm_dns_ns_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_ns_record) | resource |
| [azurerm_dns_ptr_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_ptr_record) | resource |
| [azurerm_dns_srv_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record) | resource |
| [azurerm_dns_txt_record.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | (Optional) A list of A records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name               = string<br>    ttl                = number<br>    records            = optional(list(string), [])<br>    target_resource_id = optional(string, null)<br>    tags               = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_aaaa_records"></a> [aaaa\_records](#input\_aaaa\_records) | (Optional) A list of AAAA records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name               = string<br>    ttl                = number<br>    records            = optional(list(string), [])<br>    target_resource_id = optional(string, null)<br>    tags               = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_caa_records"></a> [caa\_records](#input\_caa\_records) | (Optional) A list of CAA records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name = string<br>    ttl  = number<br>    records = list(<br>      object({<br>        flags = number<br>        tag   = string<br>        value = string<br>      })<br>    )<br>    tags = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | (Optional) A list of CNAME records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name               = string<br>    ttl                = number<br>    record             = optional(string, null)<br>    target_resource_id = optional(string, null)<br>    tags               = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | (Required) The name of the DNS Zone which should be created within the specified Resource Group. | `string` | n/a | yes |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | (Optional) A list of MX records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name = string<br>    ttl  = number<br>    records = list(<br>      object({<br>        preference = number<br>        exchange   = string<br>      })<br>    )<br>    tags = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | (Optional) A list of NS records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>    tags    = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_ptr_records"></a> [ptr\_records](#input\_ptr\_records) | (Optional) A list of PTR records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>    tags    = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_soa_record"></a> [soa\_record](#input\_soa\_record) | (Optional) A single SOA record which should be created within the specified DNS Zone. | <pre>object({<br>    email         = string<br>      host_name     = optional(string, null)<br>      expire_time   = optional(number, null)<br>      minimum_ttl   = optional(number, null)<br>      refresh_time  = optional(number, null)<br>      retry_time    = optional(number, null)<br>      serial_number = optional(number, null)<br>      ttl           = optional(number, null)<br>  })</pre> | `null` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | (Optional) A list of SRV records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name = string<br>    ttl  = number<br>    records = list(<br>      object({<br>        priority = number<br>        weight   = number<br>        port     = number<br>        target   = string<br>      })<br>    )<br>    tags = optional(map(string), null)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `null` | no |
| <a name="input_txt_records"></a> [txt\_records](#input\_txt\_records) | (Optional) A list of TXT records which should be created within the specified DNS Zone. | <pre>list(object({<br>    name = string<br>    ttl  = number<br>    records = list(<br>      object({<br>        value = string<br>      })<br>    )<br>    tags = optional(map(string), null)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_aaaa_records"></a> [aaaa\_records](#output\_aaaa\_records) | n/a |
| <a name="output_caa_records"></a> [caa\_records](#output\_caa\_records) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_id"></a> [id](#output\_id) | The ID of the DNS Zone. |
| <a name="output_mx_records"></a> [mx\_records](#output\_mx\_records) | n/a |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The Name Servers for this DNS Zone. |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | n/a |
| <a name="output_number_of_record_sets"></a> [number\_of\_record\_sets](#output\_number\_of\_record\_sets) | The number of record sets in this DNS Zone. |
| <a name="output_ptr_records"></a> [ptr\_records](#output\_ptr\_records) | n/a |
| <a name="output_srv_records"></a> [srv\_records](#output\_srv\_records) | n/a |
| <a name="output_txt_records"></a> [txt\_records](#output\_txt\_records) | n/a |
<!-- END_TF_DOCS -->