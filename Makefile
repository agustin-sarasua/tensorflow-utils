# Makefile

# Set the name of the virtual environment
VENV_NAME = .venv
KERNEL_NAME = my-kernel

# Create and activate the virtual environment
venv:
	python3 -m venv $(VENV_NAME)

# Install packages from requirements.txt
install:
	. $(VENV_NAME)/bin/activate && pip install -r requirements.txt

# Install ipykernel package
install_kernel:
	. $(VENV_NAME)/bin/activate && pip install ipykernel

# Create a Jupyter kernel for the virtual environment
kernel:
	. $(VENV_NAME)/bin/activate && python -m ipykernel install --user --name=$(KERNEL_NAME)

# Target to setup the virtual environment, install packages, and create Jupyter kernel
setup: venv install install_kernel kernel

.PHONY: venv install install_kernel kernel setup
