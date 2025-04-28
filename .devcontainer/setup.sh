#!/bin/bash
set -e

if [ -d ".venv" ]; then
    echo ".venv already exists. Activating it..."
    source .venv/bin/activate
else
    echo ".venv not found. Setting up new environment."
    
    read -p "Enter Python version to install (e.g., 3.11.4): " PYTHON_VERSION
    
    uv python install "$PYTHON_VERSION"
    uv python pin "$PYTHON_VERSION"
    uv init
    uv sync
    
    if [ ! -d ".venv" ]; then
        echo "Error: .venv was not created."
        exit 1
    fi
    
    echo "Activating new virtual environment..."
    source .venv/bin/activate
fi
