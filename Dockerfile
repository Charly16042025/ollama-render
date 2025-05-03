FROM ollama/ollama

# Expose Ollama's default port
EXPOSE 11434

# Download model when container starts (not during build)
CMD ["sh", "-c", "ollama pull mistral:instruct && ollama serve"]
