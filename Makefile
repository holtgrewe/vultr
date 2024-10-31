all: help

help:
	@echo "install-dev - Install for development with dependencies for QC and tests."
	@echo "check-quality - Run quality checks."
	@echo "test - Run tests."

# Install for development with dependencies for QC and tests.
install-dev:
	pip install ".[quality,tests]"

# Run quality checks.
check:
	black --check --diff --preview src tests
	ruff src tests
	pyright src tests

# Run tests.
test:
    run: pytest --cov=vultr --cov-report=term-missing tests/ -s --durations 0
