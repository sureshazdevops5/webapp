#!/bin/bash
set -X
git config --global user.email "sureshazdevops5@gmail.com"
git config --global user.name "azure devops"
#REPO_URL="https://cccq6o4fmhqvd6najjscvh7d4ljjbb2aen6fnbvip4cz34jmk2ea@dev.azure.com/sureshazdevops5/webapp/_git/webapp"
git clone https://cccq6o4fmhqvd6najjscvh7d41jjbb2aen6fnbvip4cz34jmk2ae@dev.azure.com/sureshazdevops5/webapp/_git/webapp/ /tmp/temp_repo
cd /tmp/temp_repo
sed -i "s|image:.*|image:testsureshacr.azurecr.io/$2:$3|g" WebApp/$1-service.yaml
git add .
git commit -m "manifest updated"
git push
rm -rf /tmp/temp_repo