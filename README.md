# AWS Incoming Layer Terraform module

Terraform module which creates an entire layer (i.e. module to be contained in its own tfstate).
It manage a trigger from s3 event to a Lambda with a ready-to-use NodeJS source code to handle
incoming files on AWS.

## Usage

```hcl
module "main" {
  source     = "genstackio/layer-incoming/aws"

  // ...
}
```
