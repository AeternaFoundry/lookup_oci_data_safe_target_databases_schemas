data "oci_data_safe_target_databases_schemas" "data_safe_target_databases_schemas_lookup" {
  for_each = var.data_safe_target_databases_schemas_lookup

  target_database_id   = each.value.target_database_id
  is_oracle_maintained = each.value.is_oracle_maintained
  schema_name          = each.value.schema_name
  schema_name_contains = each.value.schema_name_contains

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

