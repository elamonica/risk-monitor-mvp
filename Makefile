.PHONY: setup dev prod clean gitflow admin

# Setup the project
setup:
	@echo "Setting up the project..."
	chmod +x setup-gitflow.sh
	./setup-gitflow.sh

# Start development environment
dev:
	docker-compose -f docker-compose.dev.yml up -d

# Start production environment
prod:
	docker-compose up -d

# Clean up containers and volumes
clean:
	docker-compose down -v
	docker-compose -f docker-compose.dev.yml down -v

# Setup GitFlow without initializing the repository
gitflow:
	chmod +x setup-gitflow.sh
	./setup-gitflow.sh

# Create admin user
admin:
	@echo "Creating admin user..."
	docker exec -it risk-monitor-strapi yarn strapi admin:create-user --username=admin --password=password --email=admin@risk-monitor.com --firstname=Super --lastname=Admin