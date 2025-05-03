FROM ollama/ollama

# Install bash (required for shell commands)
USER root
RUN apk add --no-cache bash
USER 1000

EXPOSE 11434

# Use JSON syntax for CMD to avoid shell requirements
CMD ["/bin/bash", "-c", "ollama pull mistral:instruct && ollama serve"]
