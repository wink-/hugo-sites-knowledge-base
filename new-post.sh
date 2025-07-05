#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Script to create new posts easily
echo "Which blog?"
echo "1) The Independent Home"
echo "2) Open Source Apocalypse"
echo "3) Winkky Farms"
echo "4) Radiant Home Solutions"
echo "5) AI Independence"
echo "6) AI Sovereignty"

read -p "Select (1-6): " choice

case $choice in
    1)
        cd "$SCRIPT_DIR/the-independent-home"
        site="independent"
        ;;
    2)
        cd "$SCRIPT_DIR/open-source-apocalypse"
        site="osa"
        ;;
    3)
        cd "$SCRIPT_DIR/winkky-farms"
        site="farm"
        ;;
    4)
        cd "$SCRIPT_DIR/radiant-home-solutions"
        site="radiant"
        ;;
    5)
        cd "$SCRIPT_DIR/ai-independence"
        site="ai-independence"
        ;;
    6)
        cd "$SCRIPT_DIR/ai-sovereignty"
        site="ai-sovereignty"
        ;;
esac

read -p "Post title (use-dashes-between-words): " title

# Create the post
hugo new content posts/${title}.md

# Open in VS Code
code content/posts/${title}.md

# Start the server
echo "Starting Hugo server..."
hugo server -D &

echo "✅ Post created: ${title}"
echo "📝 Editor opened"
echo "🌐 Server running at http://localhost:1313"
echo ""
echo "Happy writing!"