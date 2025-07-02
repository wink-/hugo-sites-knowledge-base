#!/bin/bash

# Script to create new posts easily
echo "Which blog?"
echo "1) The Independent Home"
echo "2) Open Source Apocalypse"
echo "3) Winkky Farms"
echo "4) Radiant Home Solutions"

read -p "Select (1-4): " choice

case $choice in
    1)
        cd /mnt/c/Users/winkk/code/hugo-sites/the-independent-home
        site="independent"
        ;;
    2)
        cd /mnt/c/Users/winkk/code/hugo-sites/open-source-apocalypse
        site="osa"
        ;;
    3)
        cd /mnt/c/Users/winkk/code/hugo-sites/winkky-farms
        site="farm"
        ;;
    4)
        cd /mnt/c/Users/winkk/code/hugo-sites/radiant-home-solutions
        site="radiant"
        ;;
esac

read -p "Post title (use-dashes-between-words): " title

# Create the post
~/bin/hugo new content posts/${title}.md

# Open in VS Code
code content/posts/${title}.md

# Start the server
echo "Starting Hugo server..."
~/bin/hugo server -D &

echo "✅ Post created: ${title}"
echo "📝 Editor opened"
echo "🌐 Server running at http://localhost:1313"
echo ""
echo "Happy writing!"