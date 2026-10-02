.PHONY: run stop restart help

run:
	@service="$(word 2,$(MAKECMDGOALS))"; \
	if [ -z "$$service" ]; then \
		echo "Please provide a service name to run."; \
		exit 1; \
	elif [ "$$service" = "all" ]; then \
		echo "Running all services..."; \
		docker compose up -d; \
	else \
		echo "Running service: $$service..."; \
		docker compose up -d "$$service"; \
	fi

%:
	@:


stop:
	@service="$(word 2,$(MAKECMDGOALS))"; \
	if [ -z "$$service" ]; then \
		echo "Please provide a service name to stop."; \
		exit 1; \
	elif [ "$$service" = "all" ]; then \
		echo "Stopping all services..."; \
		docker compose down; \
	else \
		echo "Stopping service: $$service..."; \
		docker compose down "$$service"; \
	fi

%:
	@:

restart:
	@service="$(word 2,$(MAKECMDGOALS))"; \
	if [ -z "$$service" ]; then \
		echo "Please provide a service name to restart."; \
		exit 1; \
	elif [ "$$service" = "all" ]; then \
		echo "Restarting all services..."; \
		docker compose down && docker compose up -d; \
	else \
		echo "Restarting service: $$service..."; \
		docker compose down "$$service" && docker compose up -d "$$service"; \
	fi

help:
	@echo "Usage: make <command> [service]"
	@echo "Commands:"
	@echo "  run <service>     		Run a specific service or 'all' for all services"
	@echo "  stop <service>    		Stop a specific service or 'all' for all services"
	@echo "  restart <service> 		Restart a specific service or 'all' for all services"
	@echo "  help              		Show this help message"