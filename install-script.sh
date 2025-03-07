#!/bin/bash

# Set up colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting Risk Monitor MVP installation...${NC}"

# Create app directory if it doesn't exist
if [ ! -d "app" ]; then
    mkdir -p app
    echo -e "${GREEN}Created app directory${NC}"
fi

# Setup GitFlow
chmod +x setup-gitflow.sh
./setup-gitflow.sh

# Start Docker containers
echo -e "${BLUE}Starting Docker containers...${NC}"
docker-compose up -d

# Wait for Strapi to be ready
echo -e "${BLUE}Waiting for Strapi to be ready...${NC}"
sleep 30

# Create admin user
echo -e "${BLUE}Creating admin user...${NC}"
docker exec -it risk-monitor-strapi yarn strapi admin:create-user --username=admin --password=password --email=admin@risk-monitor.com --firstname=Super --lastname=Admin

# Print success message
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}Access the Strapi admin panel at: http://localhost:1337/admin${NC}"
echo -e "${GREEN}Username: admin${NC}"
echo -e "${GREEN}Password: password${NC}"