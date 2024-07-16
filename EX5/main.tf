locals {
    name = "aryan"
}

output "my_name" {
    value = "${local.name}"
}