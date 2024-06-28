#!/bin/bash
set -x
#
REPO_URL = "https://uutxfci222nbrlmyuzjm472kyob4jzncibkzib6nbxgf423ytaxq@dev.azure.com/sureshazdevops5/webapp/_git/webapp"
mkdir /tmp/temp_repo
git clone "$REPO_URL" /tmp/temp_repo
cd /tmp/temp_repo
sed -i "s|image:.*|image:testsureshacr.azurecr.io/$2:$3|g" WebApp/$1-service.yaml
git add .
git commit -m "manifest updated"
git push
rm -rf /tmp/temp_repo