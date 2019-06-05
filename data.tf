## Test if Client Resource Group exist
#data "external" "test_resourcegroup" {
#  program  = ["bash", "-c", "if [ -z \"$(az group exists -n \"${local.l_rgname}\")\" ]; then echo '{\"RgExists\": \"true\"}'; else echo '{\"RgExists\": \"false\"}'; fi"]
#}
