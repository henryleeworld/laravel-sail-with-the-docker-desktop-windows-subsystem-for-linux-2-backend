#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Henry Lee. All rights reserved.
#-------------------------------------------------------------------------------------------------------------

docker info > /dev/null 2>&1

# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Docker is not running."

    exit 1
fi

PROJECT_NAME='test-project'
WHITE='\033[1;37m'
NC='\033[0m'

docker run --rm \
    -v "$(pwd)":/opt \
    -w /opt \
    laravelsail/php80-composer:latest \
    bash -c "laravel new ${PROJECT_NAME} && cd ${PROJECT_NAME} && php ./artisan sail:install --with=mysql,redis,meilisearch,mailhog,selenium"

cd ${PROJECT_NAME}

echo ""

if sudo -n true 2>/dev/null; then
    sudo chown -R $USER: .
    echo -e "${WHITE}Get started with:${NC} cd ${PROJECT_NAME} && ./vendor/bin/sail up"
else
    echo -e "${WHITE}Please provide your password so we can make some final adjustments to your application's permissions.${NC}"
    echo ""
    sudo chown -R $USER: .
    echo ""
    echo -e "${WHITE}Thank you! We hope you build something incredible. Dive in with:${NC} cd ${PROJECT_NAME} && ./vendor/bin/sail up"
fi
