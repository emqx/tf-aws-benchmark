## Install
### Terraform

[install doc](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### AWS Cli

[install doc](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Config
```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
```

## run
```bash
terraform init
terraform apply -var="private_key=private key" -var="emqx_package=/you_path/emqx.zip" -var="emqx_lic=emqx license"
```