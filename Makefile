all: PHONY

help:
	@echo "clean - remove build/python artifacts"
	@echo "test - run tests"
	@echo "lint - check style with flake8"
	@echo "coverage - generate an HTML report of the coverage"
	@echo "install - install for development"

clean: clean-build clean-pyc

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf pip-wheel-metadata
	rm -rf *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '.pytest_cache' -exec rm -rf {} +

test:
	pytest -x texteditor tests

lint:
	flake8 --config=setup.cfg texteditor tests

coverage:
	pytest --cov-report html --cov texteditor texteditor tests

install:
	pip install -e .[dev]
