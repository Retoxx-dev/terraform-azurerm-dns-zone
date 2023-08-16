#################################################################
# DNS ZONE
#################################################################
resource "azurerm_dns_zone" "this" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "soa_record" {
    for_each = var.soa_record != null ? [var.soa_record] : []
    content {
      email         = soa_record.value.email
      host_name     = soa_record.value.host_name
      expire_time   = soa_record.value.expire_time
      minimum_ttl   = soa_record.value.minimum_ttl
      refresh_time  = soa_record.value.refresh_time
      retry_time    = soa_record.value.retry_time
      serial_number = soa_record.value.serial_number
      ttl           = soa_record.value.ttl
    }
  }
}

#################################################################
# DNS ZONE A RECORD
#################################################################
resource "azurerm_dns_a_record" "this" {
  for_each            = { for record in var.a_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  target_resource_id  = each.value.target_resource_id
  tags                = each.value.tags
}

#################################################################
# DNS ZONE AAAA RECORD
#################################################################
resource "azurerm_dns_aaaa_record" "this" {
  for_each            = { for record in var.aaaa_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  target_resource_id  = each.value.target_resource_id
  tags                = each.value.tags
}

#################################################################
# DNS ZONE CAA RECORD
#################################################################
resource "azurerm_dns_caa_record" "this" {
  for_each            = { for record in var.caa_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = { for record in each.value.records : record.value => record }
    content {
      flags = record.value.flags
      tag   = record.value.tag
      value = record.value.value
    }
  }
}

#################################################################
# DNS ZONE CNAME RECORD
#################################################################
resource "azurerm_dns_cname_record" "this" {
  for_each            = { for record in var.cname_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record
  target_resource_id  = each.value.target_resource_id
  tags                = each.value.tags
}

#################################################################
# DNS ZONE MX RECORD
#################################################################
resource "azurerm_dns_mx_record" "this" {
  for_each            = { for record in var.mx_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = { for record in each.value.records : record.value => record }
    content {
      preference = record.value.preference
      exchange   = record.value.exchange
    }
  }
}

#################################################################
# DNS ZONE NS RECORD
#################################################################
resource "azurerm_dns_ns_record" "this" {
  for_each            = { for record in var.ns_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record
  tags                = each.value.tags
}

#################################################################
# DNS ZONE PTR RECORD
#################################################################
resource "azurerm_dns_ptr_record" "this" {
  for_each            = { for record in var.ptr_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.record
  tags                = each.value.tags
}

#################################################################
# DNS ZONE SRV RECORD
#################################################################
resource "azurerm_dns_srv_record" "this" {
  for_each            = { for record in var.srv_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = { for record in each.value.records : record.value => record }
    content {
      priority = record.value.priority
      weight   = record.value.weight
      port     = record.value.port
      target   = record.value.target
    }
  }
}

#################################################################
# DNS ZONE TXT RECORD
#################################################################
resource "azurerm_dns_txt_record" "this" {
  for_each            = { for record in var.txt_records : record.name => record }
  name                = each.value.name
  zone_name           = azurerm_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = each.value.ttl
  tags                = each.value.tags

  dynamic "record" {
    for_each = { for record in each.value.records : record.value => record }
    content {
      value = record.value.value
    }
  }
}