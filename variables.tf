variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network Name"
}

variable "description" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network Description"
}

variable "external" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Network External"
}

variable "subnets" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Network Subnets"
}

variable "tenant_id" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Tenant ID"
}
