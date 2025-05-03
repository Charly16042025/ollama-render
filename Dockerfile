FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama && \
    chmod +x /usr/bin/ollama

# Create necessary directories
RUN mkdir -p /root/.ollama

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m

# Download model (using background process)
RUN (ollama serve &) && \
    sleep 10 && \
    ollama pull tinyllama && \
    pkill ollama

EXPOSE 11434
CMD ["ollama", "serve"]
