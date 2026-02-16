#!/bin/bash
# Local Preview Script for neovie.dev Landing Page

echo "🌐 neovie.dev Landing Page - Local Preview"
echo "=========================================="
echo ""
echo "Starting local web server..."
echo "Open http://localhost:8000 in your browser"
echo "Press Ctrl+C to stop"
echo ""

# Try Python 3 first
if command -v python3 &> /dev/null; then
    python3 -m http.server 8000
# Try Python
elif command -v python &> /dev/null; then
    python -m SimpleHTTPServer 8000
# Try Node.js
elif command -v npx &> /dev/null; then
    npx serve .
else
    echo "❌ No local server found. Please install Python 3 or Node.js."
    exit 1
fi
