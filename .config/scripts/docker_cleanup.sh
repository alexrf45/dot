#!/bin/bash
# Docker container and image cleanup
docker system prune -af
docker volume prune -f
echo "Docker cleanup completed."
