#!/bin/sh
echo "Downloading mistral:instruct..."
ollama pull mistral:instruct
echo "Starting Ollama server..."
ollama serve
