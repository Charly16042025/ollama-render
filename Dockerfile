FROM ollama/ollama

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m

# Install curl to download models manually
USER root
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
USER 1000

# Download model files directly (no 'ollama pull' needed)
RUN curl -L https://ollama.com/download/tinyllama -o /root/.ollama/models/manifests/registry.ollama.ai/library/tinyllama

EXPOSE 11434
CMD ["ollama", "serve"]
