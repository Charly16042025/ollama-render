FROM ollama/ollama

# Install bash using apt (Debian/Ubuntu package manager)
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends bash && \
    rm -rf /var/lib/apt/lists/*
USER 1000

EXPOSE 11434

# Use JSON syntax for CMD
CMD ["/bin/bash", "-c", "ollama pull mistral:instruct && ollama serve"]
