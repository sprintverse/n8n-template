# Start with the official n8n image (includes Gemini)
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install FFmpeg
USER root

# Install FFmpeg using Debian's package manager
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the standard node user
USER node
