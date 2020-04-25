## Terraform test samples

This repository contains a dummy Terraform module with a Github Actions CI implementing:

* Integration tests using `kitchen-terraform` for test orchestration
    * A sample verification using `inspec`
    * A sample verification using `pytest`
* Conformity test using `conftest` and `opa` (Open Policy Agent)

### Pros and Cons

* Inpec:
    * Pro: syntax with super easy to read
    * Con: there is a flavor for each cloud provider (inspec-azure, inspec-aws, inspec-gcp) with different support, reactivity and capabilities. I always had to open issues to request a feature addition.
* Unittest:
    * Pro: Standard test framework that Python developpers will be super confortable with. Using the framework means you will use the cloud provider Python SDK in the tests. No missing feature here.
    * Cons Kitchen is in Ruby, unittest is Python. Combining the 2 means you will have to setup Ruby and Python environment.

Tests are using the module usage example locates in `examples/`.

### Why writting integration tests with Terraform ?

When you write a module, you are using a specific version of Terraform and a specific version of a provider.
Can you safely upgrade these 2 components when a major version is released ? Spoiler: No

The providers upgrade can introduce new parameter names that are first displayed as deprecation warning before failing in other release.
If you don't follow the releases and update your modules accordingly, you could have several modules that become unusable after a few month.
Integration tests can help you detecting the failure and be sure that everything still works as expected after you made a fix.
