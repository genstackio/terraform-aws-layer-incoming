# AWS Incoming Terraform module

Terraform module which creates a Lambda with a ready-to-use NodeJS source code to handle
incoming events on AWS.

## Usage

```hcl
module "lambda-incoming" {
  source = "genstackio/layer-incoming/aws//modules/lambda"

  // ...
}
```
