# Sites Knowledge Base

A centralized knowledge base for managing seven interconnected websites, including Hugo static sites and static HTML/CSS/JS sites. This repository serves as your research hub, content planning center, and development workspace.

## 🚀 Quick Start (Any Computer)

### 1. Clone and Setup
```bash
# Clone the repository with all submodules
git clone --recurse-submodules https://github.com/wink-/sites-knowledge-base.git
cd sites-knowledge-base

# Run the setup script (first time only)
./setup.sh
```

### 2. Daily Workflow
```bash
# Quick start for daily work
./quick-start.sh

# Or manually update everything
git pull --recurse-submodules
```

### 3. Start Development
```bash
# Start all development servers at once
./dev-servers.sh

# Or start individual sites:
cd ai-independence && hugo server -D          # Hugo site
cd radiant-gardens && python -m http.server 8000  # Static site
```

## 📁 Site Portfolio

### Content Revenue Sites
- **ai-independence** (`ai-independence.com`) - Technical privacy/surveillance resistance - $3K/year target
- **ai-sovereignty** (`ai-sovereignty.com`) - Political resistance to AI control - $3.5K/year target  
- **the-independent-home** (`theindependenthome.com`) - Practical independence guides - $5.5K/year target

### Business Sites
- **radiant-home-solutions** (`radianthomesolutions.com`) - Handyman business portfolio
- **radiant-gardens** (`radiantgardens.co`) - Garden design business (static HTML)

### Hobby Sites
- **open-source-apocalypse** (`opensourceapocalypse.com`) - Maker/DIY projects
- **winkky-farms** - Personal farm blog

## 🛠 Development Workflow

### Prerequisites
- **Git** - Version control
- **Hugo 0.147.9+** - For Hugo sites
- **Python/Node.js** - For static site development
- **VS Code** - Recommended editor

### Key Commands
```bash
# Create new post (Hugo sites only)
./new-post.sh

# Update all sites
./update-sites.sh

# Check submodule status
git submodule status

# Check all site statuses
git submodule foreach 'git status'
```

### Development Servers
| Site | Port | Type | Command |
|------|------|------|---------|
| the-independent-home | 1313 | Hugo | `hugo server -D -p 1313` |
| ai-independence | 1314 | Hugo | `hugo server -D -p 1314` |
| ai-sovereignty | 1315 | Hugo | `hugo server -D -p 1315` |
| radiant-home-solutions | 1316 | Hugo | `hugo server -D -p 1316` |
| open-source-apocalypse | 1317 | Hugo | `hugo server -D -p 1317` |
| winkky-farms | 1318 | Hugo | `hugo server -D -p 1318` |
| radiant-gardens | 8000 | Static | `python -m http.server 8000` |

## 📊 Business Overview

### Revenue Targets
- **Total Annual Target**: $12K
- **6-month goal**: $1K/month
- **Traffic target**: 5K visitors/month
- **Email subscribers**: 500 total

### Content Strategy
- **Total Output**: 6-8 posts/week across all sites
- **Publishing Pattern**: Monday through Friday with weekend preparation
- **Batch Creation**: AI-assisted writing workflow

## 🔧 Scripts Overview

| Script | Purpose |
|--------|---------|
| `setup.sh` | Initial setup on new computer |
| `quick-start.sh` | Daily workflow starter |
| `dev-servers.sh` | Start all development servers |
| `new-post.sh` | Create new blog post (Hugo sites) |
| `update-sites.sh` | Update all git repositories |

## 📚 Documentation

- **CLAUDE.md** - Complete development guide
- **SITES.md** - Detailed site portfolio
- **WORKFLOW.md** - Git submodule workflows
- **MASTER-SITE-GUIDE.md** - Business strategy
- **content-workflow.md** - Content creation process

## 🚨 Troubleshooting

### Common Issues

**Submodules not initialized:**
```bash
git submodule update --init --recursive
```

**Hugo version issues:**
```bash
# Check Hugo version
hugo version

# Install Hugo 0.147.9+ if needed
# See: https://gohugo.io/installation/
```

**Port conflicts:**
```bash
# Kill processes on specific ports
lsof -ti:1313 | xargs kill -9
```

**Git submodule detached HEAD:**
```bash
cd [site-directory]
git checkout main  # or master
git pull
```

## 🎯 Success Metrics

- **Combined Traffic**: 5,000 visitors/month
- **Email Subscribers**: 500 total
- **Monthly Revenue**: $1,000
- **Digital Product Sales**: 20+ units/month
- **Consulting Clients**: 2-5 active

## 📞 Support

For issues with this repository setup, check the documentation files or create an issue in the repository.

---

**Happy coding! 🎉** 