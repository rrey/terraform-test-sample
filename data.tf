## Test if Client Resource Group exist
data "external" "test_resourcegroup" {
  program  = ["bash", "-c", "if [ -z \"$(az group exists -n \"${var.client_rgName}\")\" ]; then echo '{\"RgExists\": \"true\"}'; else echo '{\"RgExists\": \"false\"}'; fi"]
}
