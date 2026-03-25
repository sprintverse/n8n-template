# STAGE 1: Get a static version of FFmpeg
FROM mwader/static-ffmpeg:7.1 AS ffmpeg-source

# STAGE 2: Use the official n8n image (which has the Gemini nodes)
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root to copy the file
USER root

# Copy the FFmpeg binary from the first stage into the final n8n folder
COPY --from=ffmpeg-source /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg-source /ffprobe /usr/local/bin/ffprobe

# Ensure the file is executable
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# Switch back to the standard node user
USER node
