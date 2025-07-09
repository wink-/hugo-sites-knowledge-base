#!/bin/bash

# Setup script for sites-knowledge-base
# This script sets up the complete development environment on any computer

set -e  # Exit on any error

echo "🚀 Setting up sites-knowledge-base development environment"
echo "========================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

print_status "Checking prerequisites..."

# Check for required tools
check_command() {
    if ! command -v $1 &> /dev/null; then
        print_error "$1 is not installed. Please install it first."
        return 1
    fi
    print_success "$1 is available"
}

check_command git
check_command hugo

# Check Hugo version
HUGO_VERSION=$(hugo version | grep -o 'v[0-9]\+\.[0-9]\+\.[0-9]\+' | head -1)
print_status "Hugo version: $HUGO_VERSION"

# Initialize and update submodules
print_status "Initializing git submodules..."
git submodule update --init --recursive

print_success "All submodules initialized"

# Check submodule status
print_status "Checking submodule status..."
git submodule status

# Create development directories if they don't exist
print_status "Setting up development directories..."

# Create a logs directory for development
mkdir -p logs

# Create a scripts directory for local scripts
mkdir -p scripts

# Make scripts executable
chmod +x *.sh

print_success "Development directories created"

# Display next steps
echo ""
echo "========================================================"
print_success "Setup complete! Next steps:"
echo ""
echo "1. Start development on a Hugo site:"
echo "   cd ai-independence && hugo server -D"
echo ""
echo "2. Start development on a static site:"
echo "   cd radiant-gardens && python -m http.server 8000"
echo ""
echo "3. Update all sites:"
echo "   ./update-sites.sh"
echo ""
echo "4. Create a new post (Hugo sites only):"
echo "   ./new-post.sh"
echo ""
echo "5. Check submodule status:"
echo "   git submodule status"
echo ""
print_status "Happy coding! 🎉" 