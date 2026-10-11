variable "data_safe_target_databases_schemas_lookup" {
  description = <<EOT
Map of data_safe_target_databases_schemas_lookup, attributes below
Required:
    - target_database_id
Optional:
    - is_oracle_maintained
    - schema_name
    - schema_name_contains
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    target_database_id   = string
    is_oracle_maintained = optional(bool)
    schema_name          = optional(list(string))
    schema_name_contains = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

