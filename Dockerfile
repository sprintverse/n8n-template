# Start with the official n8n image (this includes the Gemini nodes)
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to install FFmpeg
USER root

# Install FFmpeg for video generation
RUN apk add --no-cache ffmpeg

# Switch back to the standard node user for security
USER node
