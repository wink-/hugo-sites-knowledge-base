# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a multi-site Hugo-based content management system for six interconnected websites. The primary focus includes independence/self-reliance content sites targeting $475K annual revenue through content marketing, affiliate programs, digital products, and consulting services, plus a professional handyman business landing page.

## Architecture Pattern

**Multi-Site Monorepo**: Each site is a separate Hugo project within the parent directory, designed as individual git repositories that can be managed collectively. This enables:
- Shared development workflows via automation scripts
- Individual site deployment to Cloudflare Pages
- Cross-site content promotion and audience sharing
- Centralized business strategy documentation

## The Six Sites

### Primary Revenue Sites (Terminal Theme - Hacker Aesthetic)
- **ai-independence** (`ai-independence.com`): Technical privacy/surveillance resistance - $150K/year target
- **ai-sovereignty** (`ai-sovereignty.com`): Political resistance to AI control - $100K/year target

### Primary Revenue Site (Ananke Theme - Clean/Accessible)
- **the-independent-home** (`theindependenthome.com`): Practical independence guides - $200K/year target

### Business Sites
- **radiant-home-solutions**: Primary handyman business landing page and portfolio (ananke theme)

### Supporting Sites
- **open-source-apocalypse**: Maker/DIY projects with cyberpunk aesthetic (terminal theme)
- **winkky-farms**: Personal farm blog for authenticity (ananke theme)

## Development Workflow

### Content Production Schedule
- **Total Output**: 8 posts/week across all sites
- **Batch Creation**: Structured weekly workflow with AI-assisted writing
- **Publishing Pattern**: Monday through Friday with weekend preparation

### Automation Scripts
```bash
# Update all git repositories in subdirectories
./update-sites.sh

# Interactive post creation with VS Code integration
./new-post.sh

# Individual site development
cd [site-directory]
hugo server -D

# Production build
cd [site-directory] 
hugo --gc --minify
```

## Site Architecture

### Standard Hugo Structure (per site)
```
site-directory/
├── hugo.toml              # Site configuration
├── content/
│   ├── posts/            # Blog posts
│   └── about.md          # Static pages
├── static/
│   └── lead-magnets/     # Digital products
├── themes/
│   ├── terminal/         # Hacker aesthetic theme
│   └── ananke/           # Clean blog theme
├── layouts/
│   └── partials/
│       └── email-capture.html  # Custom email capture
└── public/               # Generated site (build output)
```

### Key Configuration Files

**Hugo Configuration** (`hugo.toml`):
- Site-specific settings (baseURL, title, theme)
- Menu structure and navigation
- Theme-specific parameters
- Content organization rules

**Cloudflare Pages Configuration**:
- Build command: `hugo --gc --minify`
- Output directory: `public`
- Hugo version: 0.147.9 (set in environment variables)
- Environment-specific builds (production, preview, branch)

## Business Model Integration

### Monetization Architecture
- **Affiliate Marketing**: VPNs, solar equipment, privacy tools
- **Digital Products**: Courses, guides, toolkits ($47-$197 each)
- **Consulting Services**: $200-$500/hour, system design packages
- **Lead Magnets**: Email capture integrated via custom partials

### Revenue Targets (documented in MASTER-SITE-GUIDE.md)
- **6-month goal**: $25K/month combined
- **Traffic target**: 50K visitors/month
- **Email subscribers**: 5,000 total
- **Product sales**: 200+ units/month

## Content Strategy

### Site-Specific Content Focus
- **AI Independence**: Tuesday tutorials, Friday countermeasures
- **AI Sovereignty**: Monday analysis, Thursday action guides  
- **Independent Home**: Monday energy, Wednesday finance, Friday food
- **Radiant Home Solutions**: Project showcases, before/after galleries, service offerings
- **Supporting sites**: Variable schedules supporting main sites

### Content Production Tools
- **new-post.sh**: Interactive post creation with VS Code auto-launch
- **VS Code integration**: Automatic editor opening for new posts
- **Hugo server**: Auto-starts development server during post creation

## Deployment & Hosting

### Cloudflare Pages Integration
- **Automatic deployment**: Git-based builds on push
- **Hugo version**: 0.147.9 (specified in environment variables)
- **Build optimization**: `--gc --minify` flags
- **Environment handling**: Production, preview, and branch deploys
- **CDN**: Global edge network for fast content delivery
- **SSL**: Automatic HTTPS with Cloudflare certificates

### Development Environment
- **Prerequisites**: Hugo 0.147.9+, Git, VS Code
- **Local development**: `hugo server -D` for draft content
- **Theme management**: Terminal (hacker) and Ananke (clean) themes
- **Asset handling**: Lead magnets and email capture forms
- **Content management**: Direct file editing (no CMS dependency)

## Key Business Documents

- **MASTER-SITE-GUIDE.md**: Complete business strategy, revenue projections, content calendars
- **content-workflow.md**: Publishing schedules and content creation guidelines  
- **monetization-examples.md**: Specific affiliate and product examples
- **content-ideas.md**: Content planning and topic research

## Development Notes

### Current Issues
- **Path Dependencies**: Some scripts contain hardcoded paths that may need updating
- **Theme Management**: Terminal and Ananke themes duplicated across sites
- **Script Maintenance**: new-post.sh uses dynamic paths but may need site-specific updates

### Architecture Strengths
- **Scalable Content Production**: Automated workflows support high-volume publishing
- **Professional Deployment**: Cloudflare Pages integration with global CDN and proper environment handling
- **Business Integration**: Revenue tracking and monetization built into content strategy
- **Cross-Site Promotion**: Shared audiences while maintaining distinct site voices
- **Performance**: Cloudflare's global edge network ensures fast content delivery worldwide