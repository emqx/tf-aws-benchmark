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

## Init
**Note: Only run one time**
```bash
cd s3
terraform init
terraform apply -auto-approve
```

## Emqx
### Apply
```bash
cd emqx
terraform init
terraform apply -auto-approve -var="private_key=private key" -var="emqx_package=/you_path/emqx.zip" -var="emqx_lic=emqx license"
```

### Destory
```bash
cd emqx
terraform init
terraform destory -auto-approve -var="private_key=private key" -var="emqx_package=/you_path/emqx.zip" -var="emqx_lic=emqx license"
```

## Kafka
### Apply
```bash
cd kafka
terraform init
terraform apply -auto-approve -var="zk_ip=ip:2181" -var="private_key=private key"
```
### destory
```bash
cd kafka
terraform init
terraform destory -auto-approve -var="zk_ip=ip:2181" -var="private_key=private key"
```

## mysql
### Apply
```bash
cd mysql
terraform init
terraform apply -auto-approve -var="db_password=abcd1234" -var="instance_class=xxxx"
```
### destory
```bash
cd mysql
terraform init
terraform destory -auto-approve -var="db_password=abcd1234"
```

