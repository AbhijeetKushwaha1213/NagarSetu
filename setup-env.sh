#!/bin/bash

# Environment Setup Script for NagarSetu
# This script helps you create the .env.local file

echo "🚀 NagarSetu Environment Setup"
echo "================================"
echo ""

# Check if .env.local already exists
if [ -f ".env.local" ]; then
    echo "⚠️  .env.local already exists!"
    read -p "Do you want to overwrite it? (y/N): " overwrite
    if [ "$overwrite" != "y" ] && [ "$overwrite" != "Y" ]; then
        echo "❌ Setup cancelled."
        exit 0
    fi
fi

echo "📝 Please provide the following information:"
echo ""

# Get Supabase URL
echo "1️⃣  Supabase Project URL"
echo "   (Found in: Supabase Dashboard → Settings → API)"
read -p "   Enter URL [https://vzqtjhoevvjxdgocnfju.supabase.co]: " supabase_url
supabase_url=${supabase_url:-https://vzqtjhoevvjxdgocnfju.supabase.co}

# Get Supabase Anon Key
echo ""
echo "2️⃣  Supabase Anon Key"
echo "   (Found in: Supabase Dashboard → Settings → API → anon public)"
read -p "   Enter key: " supabase_key

# Get Google Maps API Key
echo ""
echo "3️⃣  Google Maps API Key (REQUIRED)"
echo "   (Get from: https://console.cloud.google.com/apis/credentials)"
read -p "   Enter key: " google_maps_key

# Get Google Vision API Key (Optional)
echo ""
echo "4️⃣  Google Cloud Vision API Key (Optional - press Enter to skip)"
read -p "   Enter key: " google_vision_key

# Get Authority Access Code
echo ""
echo "5️⃣  Authority Access Code (for admin registration)"
read -p "   Enter code [SECURE_CODE_2024]: " authority_code
authority_code=${authority_code:-SECURE_CODE_2024}

# Create .env.local file
echo ""
echo "📄 Creating .env.local file..."

cat > .env.local << EOF
# Supabase Configuration
VITE_SUPABASE_URL=$supabase_url
VITE_SUPABASE_ANON_KEY=$supabase_key

# Google Maps API (REQUIRED for map features)
VITE_GOOGLE_MAPS_API_KEY=$google_maps_key

# Google Cloud Vision API (Optional)
VITE_GOOGLE_CLOUD_VISION_API_KEY=$google_vision_key

# Authority Access Code (for admin registration)
VITE_AUTHORITY_ACCESS_CODE=$authority_code
EOF

echo ""
echo "✅ .env.local file created successfully!"
echo ""
echo "📋 Next steps:"
echo "   1. Verify the values in .env.local"
echo "   2. Restart your development server:"
echo "      npm run dev"
echo "   3. Test the map feature"
echo ""
echo "📚 For more information, see: SETUP_ENVIRONMENT.md"
echo ""
