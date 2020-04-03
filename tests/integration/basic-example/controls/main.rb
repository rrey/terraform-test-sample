# frozen_string_literal: true

#PROJECT_ID = attribute('project_id', description: 'GCP project id')
#REGION = attribute('region', description: 'GCP region')

control "main" do
  desc "Verifies that resource_group exists"

  describe azurerm_resource_groups.where(name: 'azrgr-app0-01') do
    it { should exist }

#    tags = {
#        :'ApplicationCode' => 'app0',
#        :'ApplicationName' => 'app0',
#        :'Branch' => 'PARIS',
#        :'Environment' => 'b',
#        :'Exploitation' => 'BOOST',
#        :'SecurityLevel' => 'Standard',
#    }
#    its('tags.to_h') { should eq tags }
  end
end
