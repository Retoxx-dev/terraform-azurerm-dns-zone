#################################################################
# GENERAL
#################################################################

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Kubernetes Cluster."
}

#################################################################
# DNS ZONE
#################################################################
variable "dns_zone_name" {
  type        = string
  description = "(Required) The name of the DNS Zone which should be created within the specified Resource Group."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = null
}

variable "soa_record" {
  type = object({
    email         = string
      host_name     = optional(string, null)
      expire_time   = optional(number, null)
      minimum_ttl   = optional(number, null)
      refresh_time  = optional(number, null)
      retry_time    = optional(number, null)
      serial_number = optional(number, null)
      ttl           = optional(number, null)
  })
  description = "(Optional) A single SOA record which should be created within the specified DNS Zone."
  default     = null
}

#################################################################
# DNS ZONE A RECORD
#################################################################
variable "a_records" {
  type = list(object({
    name               = string
    ttl                = number
    records            = optional(list(string), null)
    target_resource_id = optional(string, null)
    tags               = optional(map(string), null)
  }))
  description = "(Optional) A list of A records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE AAAA RECORD
#################################################################
variable "aaaa_records" {
  type = list(object({
    name               = string
    ttl                = number
    records            = optional(list(string), null)
    target_resource_id = optional(string, null)
    tags               = optional(map(string), null)
  }))
  description = "(Optional) A list of AAAA records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE CAA RECORD
#################################################################
variable "caa_records" {
  type = list(object({
    name = string
    ttl  = number
    records = list(
      object({
        flags = number
        tag   = string
        value = string
      })
    )
    tags = optional(map(string), null)
  }))
  description = "(Optional) A list of CAA records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE CNAME RECORD
#################################################################
variable "cname_records" {
  type = list(object({
    name               = string
    ttl                = number
    record             = optional(string, null)
    target_resource_id = optional(string, null)
    tags               = optional(map(string), null)
  }))
  description = "(Optional) A list of CNAME records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE MX RECORD
#################################################################
variable "mx_records" {
  type = list(object({
    name = string
    ttl  = number
    records = list(
      object({
        preference = number
        exchange   = string
      })
    )
    tags = optional(map(string), null)
  }))
  description = "(Optional) A list of MX records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE NS RECORD
#################################################################
variable "ns_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
    tags    = optional(map(string), null)
  }))
  description = "(Optional) A list of NS records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE PTR RECORD
#################################################################
variable "ptr_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
    tags    = optional(map(string), null)
  }))
  description = "(Optional) A list of PTR records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE SRV RECORD
#################################################################
variable "srv_records" {
  type = list(object({
    name = string
    ttl  = number
    records = list(
      object({
        priority = number
        weight   = number
        port     = number
        target   = string
      })
    )
    tags = optional(map(string), null)
  }))
  description = "(Optional) A list of SRV records which should be created within the specified DNS Zone."
  default     = []
}

#################################################################
# DNS ZONE TXT RECORD
#################################################################
variable "txt_records" {
  type = list(object({
    name = string
    ttl  = number
    records = list(
      object({
        value = string
      })
    )
    tags = optional(map(string), null)
  }))
  description = "(Optional) A list of TXT records which should be created within the specified DNS Zone."
  default     = []
}