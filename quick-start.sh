#!/bin/bash

# Quick start script for daily development
# Run this when you start working on any computer

set -e

echo "🚀 Quick start for sites-knowledge-base"
echo "======================================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f ".gitmodules" ]; then
    echo "❌ Error: This script must be run from the sites-knowledge-base root directory"
    exit 1
fi

# Update everything
print_status "Updating all repositories..."
git pull --recurse-submodules

print_success "All repositories updated"

# Check submodule status
print_status "Checking submodule status..."
git submodule status

# Show available sites
echo ""
echo "Available sites:"
echo "================"

# Hugo sites
echo "Hugo Sites (run 'hugo server -D' in directory):"
for site in ai-independence ai-sovereignty the-independent-home radiant-home-solutions open-source-apocalypse winkky-farms; do
    if [ -d "$site" ]; then
        echo "  📝 $site"
    fi
done

# Static sites
echo ""
echo "Static Sites (run 'python -m http.server 8000' in directory):"
for site in radiant-gardens; do
    if [ -d "$site" ]; then
        echo "  🌐 $site"
    fi
done

echo ""
print_success "Ready to work! Choose a site and start developing."
echo ""
echo "Quick commands:"
echo "  ./new-post.sh                    # Create new post (Hugo sites)"
echo "  ./update-sites.sh                # Update all sites"
echo "  git submodule status             # Check submodule status"
echo "  git submodule foreach 'git status'  # Check all site statuses" 