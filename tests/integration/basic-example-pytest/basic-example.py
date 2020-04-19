import os
import unittest
from azure.common.credentials import ServicePrincipalCredentials
from azure.mgmt.resource import ResourceManagementClient

class TestTerraformModule(unittest.TestCase):

    def setUp(self):
        subscription_id = os.environ.get('AZURE_SUBSCRIPTION_ID')
        credentials = ServicePrincipalCredentials(
            client_id=os.environ['AZURE_CLIENT_ID'],
            secret=os.environ['AZURE_CLIENT_SECRET'],
            tenant=os.environ['AZURE_TENANT_ID']
        )
        self.client = ResourceManagementClient(credentials, subscription_id)
        self.rg = self.client.resource_groups.get("my_test_rg")

    def test_resource_group_exists(self):
        self.assertTrue(self.client.resource_groups.check_existence("my_test_rg"))

    def test_resource_group_tags(self):
        self.assertTrue(("owner", "That's me !") in self.rg.tags.items())
        self.assertTrue(("some_tag", "some_tag_value") in self.rg.tags.items())
        self.assertTrue(("some_other_tag", "some_other_tag_value") in self.rg.tags.items())

    def test_resource_group_location(self):
        self.assertEqual(self.rg.location, "westeurope")


if __name__ == '__main__':
    unittest.main()
