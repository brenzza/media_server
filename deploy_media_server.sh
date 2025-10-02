!/bin/bash

# Directories containing docker-compose.yml
DIRECTORIES=(
    "/root/media_server/plex"
    "/root/media_server/qbittorrent"
    "/root/media_server/radarr"
    "/root/media_server/sonarr"
    "/root/media_server/overseer"
    "/root/media_server/prowlarr"
)

# Loop through each directory
for DIR in "${DIRECTORIES[@]}"; do
    echo "Processing directory: $DIR"
    if [ -f "$DIR/docker-compose.yml" ]; then
        cd "$DIR" || { echo "Failed to cd into $DIR"; exit 1; }
        echo "Pulling the latest images in $DIR..."
        docker compose pull
        echo "Updating services in $DIR..."
        docker compose up -d
    else
        echo "docker-compose.yml not found in $DIR"
    fi
done

# Prune old images
echo "Pruning old Docker images..."
docker image prune -af

echo "Docker images update and pruning complete."