#!/bin/bash
# Alternative Deployment Script using gh-pages branch
# This avoids the workflow scope issue by using a manual gh-pages branch

set -e

PROJECT_NAME="neovie-landingpage-v3"
GITHUB_USERNAME="JPE-Studio"

echo "🚀 Deploying $PROJECT_NAME to GitHub Pages (Alternative Method)"
echo "=============================================================="

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed"
    echo "Install: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI"
    echo "Run: gh auth login"
    exit 1
fi

cd "$(dirname "$0")"

# Create orphan gh-pages branch
echo "📦 Creating gh-pages branch..."
if git show-ref --verify --quiet refs/heads/gh-pages; then
    echo "Branch gh-pages exists, updating..."
    git checkout gh-pages
    git checkout main -- .
    git add .
    git commit -m "Update to GitHub Pages" || echo "No changes"
    git push origin gh-pages --force
else
    git checkout --orphan gh-pages
    git rm -rf .
    git checkout main -- .
    git add .
    git commit -m "Deploy to GitHub Pages"
    git push origin gh-pages --force
fi

# Switch back to main
git checkout main

echo ""
echo "✅ Deployment to gh-pages branch complete!"
echo ""
echo "📍 Next steps:"
echo "   1. Go to: https://github.com/$GITHUB_USERNAME/$PROJECT_NAME/settings/pages"
echo "   2. Under 'Build and deployment':"
echo "   3. Source: Deploy from a branch"
echo "   4. Branch: gh-pages (/)"
echo "   5. Click Save"
echo ""
echo "🔗 Your site will be available at:"
echo "   https://$GITHUB_USERNAME.github.io/$PROJECT_NAME/"
echo ""
