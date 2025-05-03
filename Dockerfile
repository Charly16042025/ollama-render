FROM ollama/ollama

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m

# Pre-download model (tinyllama works best for free tier)
RUN ollama pull tinyllama

EXPOSE 11434
CMD ["ollama", "serve"]
