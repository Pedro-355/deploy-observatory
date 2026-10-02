.PHONY: run stop

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

