FROM ollama/ollama

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_KEEP_ALIVE=5m

# Copy and prepare startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 11434
CMD ["/start.sh"]
