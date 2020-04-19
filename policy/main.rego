package main

MANDATORY_TAGS = ["owner"]
RG_NAMING_CONVENTION = "[a-z_]{10}"

hash_contains_keys(hash, item) {
	_ = hash[key]
	key = item
}

# Check that resource group names follows the naming convention
deny[msg] {
	resources := input.resource_changes[_].change.after.name
	resources[_].change.after.type == "azurerm_resource_group"
	resource_name := resources[_].change.after.name
	not re_match(RG_NAMING_CONVENTION, resource_name)
	msg = sprintf("[DENY] resource %s does not match the corporate naming convention", [resource_name])
}

# Check that resource has the expected tags
deny[msg] {
	resource := input.resource_changes[_]
	required_tag := MANDATORY_TAGS[_]
	not hash_contains_keys(resource.change.after.tags, required_tag)
	msg = sprintf("[DENY] %s should have tag '%s'", [resource.change.after.name, required_tag])
}
