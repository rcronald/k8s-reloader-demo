# Container image information: https://github.com/cse-labs/codespaces-images
FROM ghcr.io/cse-labs/k3d:latest

# Some images require specific values
ARG USERNAME=vscode

# Log the docker build start event
RUN echo "$(date +'%Y-%m-%d %H:%M:%S')    docker build start" >> /home/$USERNAME/status

# Set permissions to the new username
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# Log the docker build complete
RUN echo "$(date +'%Y-%m-%d %H:%M:%S')    docker build complete" >> /home/$USERNAME/status