#!/bin/bash

# A script to update all Hugo site repositories by pulling the latest changes.

# --- Configuration ---
# Set the base directory containing all your Hugo site repositories.
# The script will use the current directory as the base.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SITES_DIR="$SCRIPT_DIR"

# --- Script ---

# Check if the base directory exists to prevent errors.
if [ ! -d "$SITES_DIR" ]; then
    echo "❌ Error: Base directory not found at '$SITES_DIR'"
    echo "Please update the SITES_DIR variable in this script."
    exit 1
fi

echo "🚀 Starting to update all git repositories in: $SITES_DIR"
echo "-----------------------------------------------------"

updated_count=0
skipped_count=0

# Loop through each subdirectory. The `*/` ensures we only match directories.
for site_path in "$SITES_DIR"/*/; do
    # Check if the directory contains a .git folder, indicating it's a repository.
    if [ -d "${site_path}.git" ]; then
        repo_name=$(basename "$site_path")
        echo "🔄 Updating '$repo_name'..."

        # Use a subshell to change directory, so it doesn't affect the main script.
        (cd "$site_path" && git pull --ff-only)

        echo "" # Add a newline for readability.
        ((updated_count++))
    else
        ((skipped_count++))
    fi
done

echo "-----------------------------------------------------"
echo "✅ Update complete."
echo "Updated ${updated_count} repositories. Skipped ${skipped_count} non-git directories."