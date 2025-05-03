FROM ollama/ollama

# Pre-download model during build (no shell needed)
ENV OLLAMA_HOST=0.0.0.0
RUN ollama pull mistral:instruct

EXPOSE 11434
CMD ["ollama", "serve"]
