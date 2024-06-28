#!/bin/bash

# Convert line endings to Unix format
dos2unix /home/vsts/work/1/s/WebApp/updatemanifest.sh

set -x

# Set Git user identity
git config --global user.email "sureshazdevops5@gmail.com"
git config --global user.name "Suresh Nunna"

# Set the repository URL (ensure PAT is correctly handled)
REPO_URL="https://uutxfci222nbrlmyuzjm472kyob4jzncibkzib6nbxgf423ytaxq@dev.azure.com/sureshazdevops5/webapp/_git/webapp"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
sed -i "s|image:.*|image: testsureshacr.azurecr.io/$2:$3|g" $1-service.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
