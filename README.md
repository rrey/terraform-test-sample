## Terraform test samples

This repository contains a dummy Terraform module with a Github Actions CI implementing:

* Integration tests using `kitchen-terraform` for test orchestration
    * A sample verification using `inspec`
    * A sample verification using `pytest`
* Conformity test using `conftest` and `opa` (Open Policy Agent)

Tests are using the module usage example locates in `examples/`.
