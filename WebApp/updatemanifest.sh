#!/bin/bash
dos2unix /home/vsts/work/1/s/WebApp/updatemanifest.sh
set -x

# Set the repository URL
REPO_URL="https://uutxfci222nbrlmyuzjm472kyob4jzncibkzib6nbxgf423ytaxq@dev.azure.com/sureshazdevops5/webapp/_git/webapp"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: testsureshacr.azurecr.io/$2:$3|g" /WebApp/$1-service.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo