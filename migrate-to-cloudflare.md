# Migrate from Netlify to Cloudflare Pages

## Step 1: Create Cloudflare Account
1. Sign up at https://cloudflare.com
2. Go to Pages section

## Step 2: Connect Each Site

For each of your 4 sites:

1. Click "Create a project"
2. Connect to GitHub
3. Select repository
4. Configure build settings:
   - Build command: `hugo --minify`
   - Build output: `public`
   - Environment variables:
     - `HUGO_VERSION`: `0.147.9`

## Step 3: Update DNS

For each domain:
1. Add domain to Cloudflare
2. Update nameservers at your registrar
3. Pages will auto-configure SSL

## Step 4: Remove Netlify Config

```bash
# Remove netlify.toml from each site
rm netlify.toml

# Create cloudflare config instead
```

## Benefits You'll Get

1. **No bandwidth limits** - Stream all the images/videos you want
2. **Faster loading** - Cloudflare's network is massive
3. **Free analytics** - Built-in, privacy-friendly
4. **Better security** - DDoS protection included
5. **Email forwarding** - Free email routing for your domains

## For CMS: Try Frontmatter

1. Install VS Code extension: "Front Matter CMS"
2. Initialize in each project:
   ```bash
   frontmatter init
   ```
3. Configure content types
4. Write with live preview

## Cost Comparison

### Netlify (if you get traffic)
- 1TB bandwidth = $550
- Forms = $19/month
- Functions = Extra

### Cloudflare Pages
- Unlimited bandwidth = $0
- Forms = Use Formspree free tier
- Functions = 100k requests/day free

## Migration Time: ~30 minutes per site