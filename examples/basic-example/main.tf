module "basic_example" {
  source                = "../../"
  module_create         = true
  assie_applicationCode = "app01"
  assie_environment     = "dev"
  assie_branch          = "Paris"
}
