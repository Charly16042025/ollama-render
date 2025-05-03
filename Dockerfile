FROM ollama/ollama
# Pre-download a small model (free-tier friendly)
RUN ollama pull mistral:instruct
EXPOSE 11434
CMD ["ollama", "serve"]
