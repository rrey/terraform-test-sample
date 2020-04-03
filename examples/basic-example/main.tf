module "basic_example" {
  source  = "../../"
  rg_name = "my_test_rg"
  rg_owner = "That's me !"
  rg_tags = {
    some_tag = "some_tag_value"
    some_other_tag = "some_other_tag_value"
  }
}
