#!/bin/bash

# Development servers script
# Start multiple development servers for different sites

set -e

echo "🚀 Starting development servers"
echo "==============================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
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

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f ".gitmodules" ]; then
    print_error "This script must be run from the sites-knowledge-base root directory"
    exit 1
fi

# Function to start Hugo server
start_hugo_server() {
    local site=$1
    local port=$2
    
    if [ -d "$site" ] && [ -f "$site/hugo.toml" ]; then
        print_status "Starting Hugo server for $site on port $port..."
        cd "$site"
        hugo server -D -p "$port" --bind 0.0.0.0 &
        cd ..
        print_success "$site server started on http://localhost:$port"
    else
        print_warning "$site not found or not a Hugo site"
    fi
}

# Function to start static server
start_static_server() {
    local site=$1
    local port=$2
    
    if [ -d "$site" ]; then
        print_status "Starting static server for $site on port $port..."
        cd "$site"
        python -m http.server "$port" &
        cd ..
        print_success "$site server started on http://localhost:$port"
    else
        print_warning "$site not found"
    fi
}

# Kill any existing servers on these ports
kill_existing_servers() {
    print_status "Checking for existing servers..."
    for port in 1313 1314 1315 1316 1317 1318 8000; do
        if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null 2>&1; then
            print_warning "Killing existing server on port $port"
            lsof -ti:$port | xargs kill -9 2>/dev/null || true
        fi
    done
}

# Start servers
kill_existing_servers

echo ""
print_status "Starting development servers..."

# Start Hugo servers on different ports
start_hugo_server "the-independent-home" 1313
start_hugo_server "ai-independence" 1314
start_hugo_server "ai-sovereignty" 1315
start_hugo_server "radiant-home-solutions" 1316
start_hugo_server "open-source-apocalypse" 1317
start_hugo_server "winkky-farms" 1318

# Start static server
start_static_server "radiant-gardens" 8000

echo ""
echo "======================================="
print_success "All development servers started!"
echo ""
echo "Available sites:"
echo "  🌐 the-independent-home: http://localhost:1313"
echo "  🌐 ai-independence:      http://localhost:1314"
echo "  🌐 ai-sovereignty:       http://localhost:1315"
echo "  🌐 radiant-home-solutions: http://localhost:1316"
echo "  🌐 open-source-apocalypse: http://localhost:1317"
echo "  🌐 winkky-farms:         http://localhost:1318"
echo "  🌐 radiant-gardens:      http://localhost:8000"
echo ""
print_warning "Press Ctrl+C to stop all servers"
echo ""

# Wait for user to stop servers
trap 'echo ""; print_status "Stopping all servers..."; pkill -f "hugo server" 2>/dev/null || true; pkill -f "python -m http.server" 2>/dev/null || true; print_success "All servers stopped"; exit 0' INT

# Keep script running
while true; do
    sleep 1
done 