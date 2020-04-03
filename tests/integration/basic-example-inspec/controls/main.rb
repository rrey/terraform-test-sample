
control "main" do
  desc "Verifies that resource_group exists"

  describe azurerm_resource_groups.where(name: 'my_test_rg') do
    it { should exist }

    tags = {
      "owner" => "That's me !",
      "some_tag" => "some_tag_value",
      "some_other_tag" => "some_other_tag_value"
    }
    its('tags') { should include(tags) }
  end
end
