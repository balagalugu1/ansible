#!/bin/bash
for I in {1..10}; do
    echo $I
done

mkdir /tmp/testfolder1
t_version='1.5.7'
apt install -y unzip
rm -rf *.zip && rm -rf usr/local/bin/terraform
wget https://releases.hashicorp.com/terraform/${t_version}/terraform_${t_version}_linux_amd64.zip
unzip terraform_${t_version}_linux_amd64.zip && chmod 777 terraform
mv terraform /usr/local/bin
terraform version
