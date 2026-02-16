#!/bin/bash
# Deployment Script for neovie.dev Landing Page
# This script helps deploy the site to GitHub Pages

echo "🚀 neovie.dev Landing Page Deployment"
echo "======================================"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) not found. Please install it first."
    echo "   https://cli.github.com/"
    exit 1
fi

# Check if logged in
if ! gh auth status &> /dev/null; then
    echo "❌ Not logged in to GitHub. Please run: gh auth login"
    exit 1
fi

echo "✓ GitHub CLI detected and authenticated"
echo ""

# Show deployment instructions
cat << 'EOF'
📋 MANUAL GITHUB PAGES SETUP (Required once):

Since GitHub Pages cannot be enabled programmatically via the current API token,
please follow these steps:

1. Open this URL in your browser:
   https://github.com/JPE-Studio/neovie-landingpage-v3/settings/pages

2. Under "Build and deployment":
   - Source: Select "Deploy from a branch"
   - Branch: Select "main"
   - Folder: Select "/ (root)"
   - Click "Save"

3. Wait 2-5 minutes for the site to deploy
   - You'll see a link at: https://github.com/JPE-Studio/neovie-landingpage-v3/settings/pages

4. Your live site will be at:
   https://jpe-studio.github.io/neovie-landingpage-v3/

EOF

# Verify git status
echo "📊 Current Git Status:"
git status -sb

echo ""
echo "✓ Repository is ready for GitHub Pages deployment"
echo "🔗 Repository: https://github.com/JPE-Studio/neovie-landingpage-v3"
echo ""
echo "After manual setup, push changes to deploy:"
echo "  git add ."
echo "  git commit -m 'Update content'"
echo "  git push"
echo ""
echo "GitHub Pages will automatically redeploy within minutes!"
