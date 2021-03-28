# AWS API Status Layer Terraform module

Terraform module which creates an entire layer (i.e. module to be contained in its own tfstate).
It manage an API Gateway v2 linked to a Lambda with a ready-to-use NodeJS source code to handle
status on AWS.

## Usage

```hcl
module "main" {
  source     = "genstackio/layer-api-status/aws"

  env        = "prod"
  dns        = "status.mydomain.com"
  dns_zone   = "id-of-the-route53-zone"
}
```
