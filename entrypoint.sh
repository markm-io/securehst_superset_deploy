#!/bin/sh

# Check if the local repository is up-to-date with origin/main
REMOTE_COMMIT=$(git ls-remote origin -h refs/heads/main | cut -f1)
LOCAL_COMMIT=$(git rev-parse HEAD)

if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
    echo "Repository is not up-to-date. Pulling the latest changes..."
    git pull || { echo "Failed to pull updates. Exiting."; exit 1; }
else
    echo "Repository is up-to-date."
fi

# Execute the main command passed to the script
exec "$@"