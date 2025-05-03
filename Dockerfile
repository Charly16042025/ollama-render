FROM ubuntu:22.04

# 1. Install dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# 2. Install Ollama using specific version URL
RUN wget https://github.com/ollama/ollama/releases/download/v0.1.36/ollama-linux-amd64 -O /usr/bin/ollama && \
    chmod +x /usr/bin/ollama

# 3. Create model directory
RUN mkdir -p /root/.ollama

# 4. Set environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m
ENV OLLAMA_NO_MEMLOCK=1

# 5. Download model (with extended wait time)
RUN (OLLAMA_HOST=0.0.0.0 /usr/bin/ollama serve &) && \
    sleep 45 && \
    OLLAMA_HOST=0.0.0.0 /usr/bin/ollama pull tinyllama && \
    pkill ollama

EXPOSE 11434
CMD ["/usr/bin/ollama", "serve"]
