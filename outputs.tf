#################################################################
# DNS ZONE
#################################################################
output "id" {
  value       = azurerm_dns_zone.this.id
  description = "The ID of the DNS Zone."
}

output "number_of_record_sets" {
  value       = azurerm_dns_zone.this.number_of_record_sets
  description = "The number of record sets in this DNS Zone."
}

output "name_servers" {
  value       = azurerm_dns_zone.this.name_servers
  description = "The Name Servers for this DNS Zone."
}

#################################################################
# DNS ZONE A RECORDS
#################################################################

output "a_records" {
  value = { for record in azurerm_dns_a_record.this : record.name => record }
}

#################################################################
# DNS ZONE AAAA RECORDS
#################################################################

output "aaaa_records" {
  value = { for record in azurerm_dns_aaaa_record.this : record.name => record }
}

#################################################################
# DNS ZONE CAA RECORDS
#################################################################

output "caa_records" {
  value = { for record in azurerm_dns_caa_record.this : record.name => record }
}

#################################################################
# DNS ZONE CNAME RECORDS
#################################################################

output "cname_records" {
  value = { for record in azurerm_dns_cname_record.this : record.name => record }
}

#################################################################
# DNS ZONE MX RECORDS
#################################################################

output "mx_records" {
  value = { for record in azurerm_dns_mx_record.this : record.name => record }
}

#################################################################
# DNS ZONE NS RECORDS
#################################################################

output "ns_records" {
  value = { for record in azurerm_dns_ns_record.this : record.name => record }
}

#################################################################
# DNS ZONE PTR RECORDS
#################################################################

output "ptr_records" {
  value = { for record in azurerm_dns_ptr_record.this : record.name => record }
}

#################################################################
# DNS ZONE SRV RECORDS
#################################################################

output "srv_records" {
  value = { for record in azurerm_dns_srv_record.this : record.name => record }
}

#################################################################
# DNS ZONE TXT RECORDS
#################################################################

output "txt_records" {
  value = { for record in azurerm_dns_txt_record.this : record.name => record }
}