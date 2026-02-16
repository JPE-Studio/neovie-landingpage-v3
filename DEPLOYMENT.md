# 🚀 neovie.dev Landing Page - Deployment Guide

## ✅ Current Status

**Repository:** https://github.com/JPE-Studio/neovie-landingpage-v3  
**Branches:** `main` (source), `gh-pages` (deployment)  
**Site Status:** ⚠️ **PENDING MANUAL GITHUB PAGES SETUP**

## 📋 Quick Setup (One-Time)

### Step 1: Enable GitHub Pages

1. Open this URL in your browser:
   ```
   https://github.com/JPE-Studio/neovie-landingpage-v3/settings/pages
   ```

2. Under "Build and deployment":
   - **Source:** Select "Deploy from a branch"
   - **Branch:** Select "gh-pages"
   - **Folder:** Select "/ (root)"
   - Click **Save**

3. Wait 2-5 minutes for GitHub to deploy the site

4. Your live site will be available at:
   ```
   https://jpe-studio.github.io/neovie-landingpage-v3/
   ```

## 🔄 Update Workflow

After making changes to `index.html`:

```bash
# 1. Commit changes to main branch
git add .
git commit -m "Describe your changes"
git push origin main

# 2. Update gh-pages branch
bash deploy-update.sh

# 3. GitHub Pages automatically redeploys within minutes
```

The `deploy-update.sh` script:
- Switches to `gh-pages` branch
- Copies all files from `main`
- Commits and pushes to `gh-pages`
- Switches back to `main`

## 🖥️ Local Preview

Before deploying, test locally:

```bash
# Option 1: Using the provided script
bash preview.sh

# Option 2: Python 3
python3 -m http.server 8000

# Option 3: Node.js
npx serve .
```

Then open: http://localhost:8000

## 📊 Deployment Architecture

```
┌─────────────────┐
│  main branch   │ ← Source code (index.html, etc.)
└────────┬────────┘
         │ git push
         │
    [deploy-update.sh]
         │
         ▼
┌─────────────────┐
│  gh-pages branch│ ← GitHub Pages reads this
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  GitHub Pages   │ ← Automatic deployment
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│  jpe-studio.github.io/...       │ ← Live site
└─────────────────────────────────┘
```

## 🔍 Troubleshooting

### Site not deploying?

1. Check GitHub Actions:
   - Go to: https://github.com/JPE-Studio/neovie-landingpage-v3/actions
   - Verify the "Deploy to GitHub Pages" workflow succeeded

2. Verify Pages settings:
   - Go to: https://github.com/JPE-Studio/neovie-landingpage-v3/settings/pages
   - Confirm source is "gh-pages" and folder is "/"

3. Check branch status:
   ```bash
   git branch -a
   # Should show both main and gh-pages
   ```

### Changes not showing?

1. GitHub Pages may take 2-5 minutes to deploy
2. Clear browser cache (Ctrl+Shift+R / Cmd+Shift+R)
3. Verify gh-pages branch has latest changes:
   ```bash
   git log gh-pages --oneline -1
   ```

### Deployment script fails?

1. Ensure you're in the project directory
2. Check git status:
   ```bash
   git status
   ```
3. Manually update gh-pages:
   ```bash
   git checkout gh-pages
   git checkout main -- .
   git add .
   git commit -m "Manual update"
   git push origin gh-pages
   git checkout main
   ```

## 📈 Monitoring

### Check deployment status
- **GitHub Actions:** https://github.com/JPE-Studio/neovie-landingpage-v3/actions
- **Pages Settings:** https://github.com/JPE-Studio/neovie-landingpage-v3/settings/pages
- **Live Site:** https://jpe-studio.github.io/neovie-landingpage-v3/

### Site analytics (future)
To add analytics (Google Analytics, Plausible, etc.), edit `index.html` and add the tracking code before the closing `</head>` tag.

## 🎯 Best Practices

### Before deploying
1. Test locally (`bash preview.sh`)
2. Check mobile responsiveness (use browser dev tools)
3. Verify all links work
4. Test the contact form
5. Validate HTML: https://validator.w3.org/

### Commit messages
Use clear, descriptive commit messages:
```
git commit -m "Fix typo in contact section"
git commit -m "Update pricing tiers"
git commit -m "Add new testimonial"
```

### Version control
- Keep `main` as your development branch
- Always push changes to `main` first
- Use `deploy-update.sh` to sync to `gh-pages`
- Never directly edit on `gh-pages` branch

## 📦 Project Structure

```
neovie-landingpage-v3/
├── index.html              # Main landing page (1 file = entire site!)
├── README.md              # Project documentation
├── PROJECT_SUMMARY.md     # Detailed project overview
├── DEPLOYMENT.md          # This file
├── deploy.sh              # Setup instructions
├── deploy-update.sh       # Update script (⭐ USE THIS)
├── preview.sh             # Local preview script
└── .gitignore            # Git ignore rules
```

## 🆘 Support

If you encounter issues:

1. Check this guide first
2. Review GitHub Actions logs
3. Verify Pages settings
4. Test locally before deploying

For design or content questions, refer to:
- `PROJECT_SUMMARY.md` - Complete project overview
- `README.md` - Quick reference

---

**Happy deploying! 🎉**

Your neovie.dev landing page is ready to go live once GitHub Pages is enabled via the manual setup above.
