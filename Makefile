# Copyright 2018 Robert Haas
# For license information, see LICENSE.TXT

# Remarks on this Makefile
# - It simplifies tasks that are useful for development and maintenance of a Python
#   package, such as installing it in development mode, running tests, style checks and
#   cleaning up folders.
# - It was inspired by
#   - https://krzysztofzuraw.com/blog/2016/makefiles-in-python-projects.html
#   - http://blog.horejsek.com/makefile-with-python
# - This script is provided "as is", without warranty of any kind. You may use it as you like,
#   however, at your own risk, especially that of accidental data loss.
#
# Installation of all tools that are used in this Makefile
# - pip install flake8 isort pycodestyle pyflakes pylint pytest pytest-benchmark pytest-cov
#
# Usage
# - Makefiles are used with a make utility that can be invoked on the command line:
#   - In general: make <target>
#   - Concrete example: make help
#
# References
# - Automation of tasks
#   - GNU Make: https://www.gnu.org/software/make
# - Code analysis including style checking
#   - Flake8: http://flake8.pycqa.org
#   - isort: https://github.com/timothycrosley/isort
#   - pycodestyle: https://pycodestyle.readthedocs.io
#   - Pyflakes: https://github.com/PyCQA/pyflakes
#   - Pylint & Pyreverse: https://www.pylint.org
# - Testing
#   - pytest: https://docs.pytest.org/en/latest
#   - pytest-benchmark: https://github.com/ionelmc/pytest-benchmark
#   - pytest-cov: https://github.com/pytest-dev/pytest-cov


PKG_NAME = unified_map
PKG_ABBREVIATION = um


.DEFAULT: help
.PHONY: help
help:
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "Help"
	@echo
	@echo "    make help"
	@echo "        show this help message"
	@echo
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "Installation"
	@echo
	@echo "    make install"
	@echo "        install the package from this local folder"
	@echo
	@echo "    make install-dev"
	@echo "        install the package from this local folder in editable mode for development"
	@echo
	@echo "    make uninstall"
	@echo "        uninstall the package"
	@echo
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "Usage"
	@echo
	@echo "    make run-python"
	@echo "        launch a Python shell and import the package"
	@echo
	@echo "    make run-ipython"
	@echo "        launch an IPython shell and import the package"
	@echo
	@echo "--------------------------------------------------------------------------------"
	@echo
	@echo "Development"
	@echo
	@echo "    make benchmark-univariate"
	@echo "        run benchmarks from the benchmark folder with pytest-benchmark"
	@echo
	@echo "    make benchmark-multivariate"
	@echo "        run benchmarks from the benchmark folder with pytest-benchmark"
	@echo
	@echo "    make clean"
	@echo "        clean up this local folder (delete *.pyc and other files incl. docs build)"
	@echo
	@echo "    make docs"
	@echo "        generate HTML documentation in docs/build directory"
	@echo
	@echo "    make stylecheck-isort"
	@echo "        check for Python style conventions with isort (=looking at import order)"
	@echo
	@echo "    make stylecheck-flake8"
	@echo "        check for Python style conventions with flake8 (=simple style checks)"
	@echo
	@echo "    make stylecheck-pycodestyle"
	@echo "        check for Python style conventions with pycodestyle (=simple style checks)"
	@echo
	@echo "    make stylecheck-pycodestyle-detailed"
	@echo "        check for Python style conventions with pycodestyle, show source code and PEP 8 text"
	@echo
	@echo "    make stylecheck-pyflakes"
	@echo "        check for Python style conventions with pyflakes (=simple style checks)"
	@echo
	@echo "    make stylecheck-pylint"
	@echo "        check for Python style conventions with pylint (=comprehensive checks)"
	@echo
	@echo "    make stylecheck-pylint-detailed"
	@echo "        check for Python style conventions with pylint, show detailed reports"
	@echo
	@echo "    make test"
	@echo "        run tests from files in the test folder with pytest"
	@echo
	@echo "    make todo"
	@echo "        check for TODO comments in source code with pylint"
	@echo
	@echo "    make uml"
	@echo "        create UML diagrams from Python code in this local folder"
	@echo
	@echo "    make uml-detailed"
	@echo "        create detailed UML diagrams from Python code in this local folder"
	@echo
	@echo "--------------------------------------------------------------------------------"


# Installation

.PHONY: install
install:
	pip install .

.PHONY: install-dev
install-dev:
	pip install -e .

.PHONY: uninstall
uninstall:
	pip uninstall $(PKG_NAME) -y


# Usage

.PHONY: run-python
run-python:
	python -i -c "import $(PKG_NAME) as $(PKG_ABBREVIATION)"

.PHONY: run-ipython
run-ipython:
	ipython -i -c "import $(PKG_NAME) as $(PKG_ABBREVIATION)"


# Development

.PHONY: benchmark-univariate
benchmark-univariate:
	pytest benchmarks/test_univariate_times.py --benchmark-warmup="on" --benchmark-min-rounds=10

.PHONY: benchmark-multivariate
benchmark-multivariate:
	pytest benchmarks/test_multivariate_times.py --benchmark-warmup="on" --benchmark-min-rounds=10

.PHONY: clean
clean:
	-@find . -name "__pycache__" -type d -exec rm -rf {} \; 2> /dev/null || true
	-@find . -name "*.egg-info" -type d -exec rm -rf {} \; 2> /dev/null || true
	-@find . -name '*.pyc' -exec rm --force {} + 2> /dev/null || true
	-@find . -name '*.pyo' -exec rm --force {} + 2> /dev/null || true
	-@find . -name '*~' -exec rm --force  {} + 2> /dev/null || true
	-@find . -name ".cache" -type d -exec rm -rf {} \; 2> /dev/null || true
	-@find . -name ".pytest_cache" -type d -exec rm -rf {} \; 2> /dev/null || true
	-@find . -name '*_uml.svg' -exec rm --force  {} + 2> /dev/null || true
	-@find . -name 'dask-worker-space' -exec rm -rf {} \; 2> /dev/null || true
	-@rm -rf .coverage* .benchmarks htmlcov
	-@rm -rf docs/build/
	-@rm -rf build dist
	@echo "Cleaned everything."

.PHONY: docs
docs:
	@cd docs; rm -rf build; make html

.PHONY: stylecheck-isort
stylecheck-isort:
	isort -rc $(PKG_NAME) --diff

.PHONY: stylecheck-flake8
stylecheck-flake8:
	flake8 $(PKG_NAME)

.PHONY: stylecheck-pycodestyle
stylecheck-pycodestyle:
	pycodestyle $(PKG_NAME)

.PHONY: stylecheck-pycodestyle-detailed
stylecheck-pycodestyle-detailed:
	pycodestyle $(PKG_NAME) --show-source --show-pep8

.PHONY: stylecheck-pyflakes
stylecheck-pyflakes:
	pyflakes $(PKG_NAME)

.PHONY: stylecheck-pylint
stylecheck-pylint:
	pylint $(PKG_NAME) --disable=W0511

.PHONY: stylecheck-pylint-detailed
stylecheck-pylint-detailed:
	pylint $(PKG_NAME) --reports=yes --disable=W0511

.PHONY: test
test:
	pytest tests --cov=$(PKG_NAME) --cov-report html

.PHONY: todo
todo:
	pylint $(PKG_NAME) --disable=all --enable=W0511

.PHONY: uml
uml:
	pyreverse $(PKG_NAME) -o svg -f PUB_ONLY -p uml
	@echo
	@echo 'Created "classes_uml.svg" and "packages_uml.svg"'

.PHONY: uml-detailed
uml-detailed:
	pyreverse $(PKG_NAME) -o svg -p detailed_uml
	@echo
	@echo 'Created "classes_detailed_uml.svg" and "packages_detailed_uml.svg"'
