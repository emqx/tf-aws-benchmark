## Packer for emqx image

1. Create a local SSH key
> ssh-keygen -t rsa -C "your_email@example.com" -f ./emqx-packer

2. Build the emqx image
> cd images
> packer init .
> packer build image.pkr.hcl

3. Get the ami from the output
> aws-zone: ami-xxx

