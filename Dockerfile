FROM ubuntu:22.04

# 1. Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# 2. Install Ollama
RUN curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama && \
    chmod +x /usr/bin/ollama

# 3. Setup model download in one reliable step
RUN mkdir -p /root/.ollama && \
    (OLLAMA_HOST=0.0.0.0 /usr/bin/ollama serve &) && \
    sleep 20 && \
    OLLAMA_HOST=0.0.0.0 /usr/bin/ollama pull tinyllama && \
    pkill ollama

# 4. Runtime configuration
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m
EXPOSE 11434
CMD ["/usr/bin/ollama", "serve"]
