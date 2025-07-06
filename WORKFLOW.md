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

## Quick Reference

| Task | Command |
|------|---------|
| Clone with submodules | `git clone --recurse-submodules [url]` |
| Initialize submodules | `git submodule update --init --recursive` |
| Update all submodules | `git submodule update --remote --merge` |
| Check status | `git submodule status` |
| Pull everything | `git pull --recurse-submodules` |
| See changes | `git submodule summary` |