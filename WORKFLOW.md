# WORKFLOW.md - Git Submodule Commands & Development Workflow

## Initial Setup

### Clone Repository with All Submodules
```bash
# Clone the repository and all submodules in one command
git clone --recurse-submodules https://github.com/wink-/sites-knowledge-base

# OR if you already cloned without submodules
git submodule update --init --recursive
```

## Working with Submodules

### Update Submodules
```bash
# Pull in the submodules after cloning (if not using --recurse-submodules)
git submodule update --init --recursive

# Update all submodules to their latest commits on their tracked branches
git submodule update --remote --merge

# Pull latest changes for parent repo and all submodules
git pull --recurse-submodules
```

### Check Submodule Status
```bash
# See status of all submodules
git submodule status

# See detailed status including branch tracking
git submodule foreach 'echo $name: && git status'
```

### Working in Individual Sites
```bash
# Navigate to a specific site
cd ai-independence

# Make changes and commit within the submodule
git add .
git commit -m "Update content"
git push

# Go back to parent repository
cd ..

# Update the parent repository to track the new submodule commit
git add ai-independence
git commit -m "Update ai-independence submodule"
git push
```

## Development Scripts

### Create New Post (Interactive)
```bash
# Run from parent directory
./new-post.sh
```

### Update All Sites
```bash
# Pull latest changes for all sites
./update-sites.sh
```

### Local Development
```bash
# Start Hugo server for any site
cd [site-directory]
hugo server -D

# Build for production
hugo --gc --minify
```

## Hugo Site Development

### Creating Content
```bash
# Create a new blog post
cd [site-directory]
hugo new posts/my-new-post.md

# Create a new page
hugo new about.md

# Create with a specific archetype
hugo new --kind post posts/my-post.md
```

### Hugo Server Options
```bash
# Basic development server with drafts
hugo server -D

# Specify custom port
hugo server -D -p 1315

# Bind to all network interfaces (access from other devices)
hugo server -D --bind 0.0.0.0

# Watch for changes (enabled by default)
hugo server -D --watch

# Disable fast render for troubleshooting
hugo server -D --disableFastRender

# Build drafts and future posts
hugo server -D -F
```

### Building Sites
```bash
# Basic build
hugo

# Production build with cleanup and minification
hugo --gc --minify

# Build with drafts
hugo -D

# Build to custom directory
hugo -d ../public

# Build with verbose output
hugo -v

# Check for errors without building
hugo check
```

### Working with Themes
```bash
# Add a theme as a submodule
cd [site-directory]
git submodule add https://github.com/[theme-repo] themes/[theme-name]

# Update theme
cd themes/[theme-name]
git pull origin main
cd ../..
git add themes/[theme-name]
git commit -m "Update theme"

# Override theme files
# Create same directory structure in site root
mkdir -p layouts/partials
cp themes/[theme-name]/layouts/partials/header.html layouts/partials/
# Edit the copied file
```

### Hugo Configuration
```bash
# Main config file locations (in order of precedence)
# hugo.toml (preferred)
# hugo.yaml
# hugo.json
# config.toml (legacy)

# Check configuration
hugo config

# List all site variables
hugo list all

# List specific content
hugo list drafts
hugo list future
hugo list expired
```

### Content Management
```bash
# Create content with current date
cd [site-directory]
hugo new posts/$(date +%Y-%m-%d)-my-post.md

# Convert content formats
hugo convert toTOML
hugo convert toYAML
hugo convert toJSON

# Find unused templates
hugo list unused
```

### Batch Operations
```bash
# Build all sites
for site in */; do
  if [ -f "$site/hugo.toml" ]; then
    echo "Building $site"
    cd "$site"
    hugo --gc --minify
    cd ..
  fi
done

# Start development servers on different ports
cd the-independent-home && hugo server -D -p 1313 &
cd ai-independence && hugo server -D -p 1314 &
cd ai-sovereignty && hugo server -D -p 1315 &
```

### Front Matter Examples
```yaml
---
title: "My New Post"
date: 2024-01-15T10:00:00-05:00
draft: true
tags: ["tutorial", "guide"]
categories: ["technical"]
description: "A brief description for SEO"
author: "Your Name"
---
```

### Useful Hugo Commands
```bash
# Generate site statistics
hugo list all --format json | jq '.pages | length'

# Clean build artifacts
rm -rf public/ resources/

# Check for broken links (requires hugo v0.91+)
hugo --enableGitInfo --buildDrafts --buildFuture --printPathWarnings

# Create a new site
hugo new site [site-name]

# Get Hugo version
hugo version

# Benchmark site build
hugo --templateMetrics --templateMetricsHints
```

## Common Workflows

### 1. Starting Fresh Development Session
```bash
# Update everything
git pull --recurse-submodules
./update-sites.sh

# Check status
git submodule status
```

### 2. Making Changes to Multiple Sites
```bash
# Work in each site
cd the-independent-home
# ... make changes ...
git add .
git commit -m "Add new post"
git push

cd ../ai-independence
# ... make changes ...
git add .
git commit -m "Update content"
git push

# Update parent repository
cd ..
git add the-independent-home ai-independence
git commit -m "Update submodules: new content added"
git push
```

### 3. Sync After Team Member Changes
```bash
# Get all updates
git pull
git submodule update --recursive

# Or in one command
git pull --recurse-submodules
```

### 4. Check What Changed
```bash
# See which submodules have changes
git submodule summary

# See detailed changes in each submodule
git submodule foreach 'git log --oneline -5'
```

## Troubleshooting

### Submodule HEAD Detached
```bash
# If a submodule shows "HEAD detached"
cd [submodule-directory]
git checkout main  # or master
git pull
```

### Reset Submodule to Recorded State
```bash
# Reset a specific submodule
git submodule update --force [submodule-name]

# Reset all submodules
git submodule update --force --recursive
```

### Remove and Re-add Submodule
```bash
# Remove submodule
git rm [submodule-path]
git commit -m "Remove submodule"

# Re-add submodule
git submodule add https://github.com/wink-/[repo-name] [submodule-path]
git commit -m "Re-add submodule"
```

## Best Practices

1. **Always commit submodule changes first**, then update the parent repository
2. **Use descriptive commit messages** when updating submodule pointers
3. **Pull with --recurse-submodules** to avoid out-of-sync issues
4. **Check submodule status** before pushing parent repository
5. **Document any branch changes** if submodules track non-default branches

## Hugo-Specific Workflows

### 1. Creating a Week's Worth of Content
```bash
# Monday - Create posts for the week
cd the-independent-home
hugo new posts/2024-01-15-solar-panel-basics.md
hugo new posts/2024-01-17-financial-independence-guide.md
hugo new posts/2024-01-19-water-storage-systems.md

cd ../ai-independence
hugo new posts/2024-01-16-local-ai-setup.md
hugo new posts/2024-01-19-privacy-tools-review.md

# Start all development servers
cd .. && ./start-dev-servers.sh
```

### 2. Publishing Workflow
```bash
# 1. Write and preview locally
cd [site-directory]
hugo server -D

# 2. Remove draft status from front matter
# Edit the post and change: draft: true → draft: false

# 3. Build and verify
hugo --gc --minify
hugo check

# 4. Commit and push (triggers Cloudflare deployment)
git add .
git commit -m "Publish: [post title]"
git push

# 5. Update parent repository
cd ..
git add [site-directory]
git commit -m "Update [site-name]: published new post"
git push
```

### 3. SEO Optimization Workflow
```bash
# Check for missing meta descriptions
grep -r "description:" content/ | grep -E '""$|: $'

# Generate sitemap (automatic with hugo)
hugo --gc --minify
ls public/sitemap.xml

# Check build size
du -sh public/

# Analyze page weight
find public -name "*.html" -exec du -h {} \; | sort -rh | head -20
```

### 4. Theme Customization Workflow
```bash
# 1. Find the file to override in the theme
find themes/[theme-name] -name "*.html" | grep -i header

# 2. Copy to site layouts
mkdir -p layouts/partials
cp themes/[theme-name]/layouts/partials/header.html layouts/partials/

# 3. Edit the local copy
# Your changes override the theme

# 4. Test changes
hugo server -D --disableFastRender
```

### 5. Multi-Site Content Cross-Promotion
```bash
# Create related content across sites
cd the-independent-home
hugo new posts/solar-power-guide.md

cd ../ai-independence  
hugo new posts/solar-powered-ai-server.md

# Add cross-links in content
# In solar-power-guide.md:
# "For running AI locally on solar, see [our technical guide](https://ai-independence.com/posts/solar-powered-ai-server/)"
```

## Quick Reference

| Task | Command |
|------|---------|
| **Git Submodules** | |
| Clone with submodules | `git clone --recurse-submodules [url]` |
| Initialize submodules | `git submodule update --init --recursive` |
| Update all submodules | `git submodule update --remote --merge` |
| Check status | `git submodule status` |
| Pull everything | `git pull --recurse-submodules` |
| See changes | `git submodule summary` |
| **Hugo Commands** | |
| New post | `hugo new posts/title.md` |
| Start server | `hugo server -D` |
| Production build | `hugo --gc --minify` |
| List drafts | `hugo list drafts` |
| Check config | `hugo config` |
| Version info | `hugo version` |