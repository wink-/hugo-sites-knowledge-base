# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a multi-site Hugo-based content management system for six interconnected websites focused on independence, self-reliance, and resistance to surveillance. The sites share a common business strategy targeting $475K annual revenue through content, affiliate marketing, digital products, and consulting.

## Site Structure

Each site lives in its own directory with standard Hugo structure:
- **ai-independence**: Technical privacy/surveillance resistance (terminal theme)
- **ai-sovereignty**: Political resistance to AI control (terminal theme)
- **open-source-apocalypse**: Maker/DIY projects with cyberpunk aesthetic (ananke theme)
- **the-independent-home**: Practical independence guides (ananke theme)
- **winkky-farms**: Personal farm blog (ananke theme)
- **radiant-home-solutions**: Local handyman business

## Common Commands

```bash
# Update all git repositories in subdirectories
./update-sites.sh

# Create new post (interactive - currently hardcoded paths)
./new-post.sh

# Run Hugo server for a specific site
cd [site-directory]
hugo server -D

# Build a site
cd [site-directory]
hugo

# Create new content
cd [site-directory]
hugo new posts/my-post-title.md
```

## Important Files

- **MASTER-SITE-GUIDE.md**: Comprehensive business plan, monetization strategies, content schedules
- **content-workflow.md**: Publishing guidelines and schedules (8 posts/week across all sites)
- **monetization-examples.md**: Specific product and affiliate examples
- **update-sites.sh**: Git pull automation for all site directories
- **new-post.sh**: Content creation helper (needs path updates)

## Architecture Notes

1. **Multi-Site Strategy**: Sites are designed to cross-promote and share audiences while maintaining distinct voices and topics
2. **Content Production**: Structured weekly schedule with batch creation and AI-assisted writing
3. **Monetization Focus**: Each site has specific revenue targets through affiliates, digital products, and services
4. **Deployment**: Sites use Netlify with CMS integration (config in static/admin/)

## Working with Sites

When modifying site content or configuration:
- Each site has its own `hugo.toml` or `config.toml`
- Themes are in `themes/` subdirectory per site
- Content goes in `content/posts/` for blog posts
- Static files (including Netlify CMS) in `static/`
- Some sites have custom CSS in `assets/` or `static/css/`

## Script Notes

The shell scripts contain hardcoded paths that need updating:
- `new-post.sh`: References `/mnt/c/Users/winkk/code/hugo-sites/`
- `update-sites.sh`: Now uses dynamic path resolution