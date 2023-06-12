#!/bin/bash

# Install Node.js dependencies
npm install

# Build for Windows
npx electron-forge make --platform=win32

# Create Windows installer
npx electron-forge create-installer --platform=win32 --arch=x64

# Build for macOS
npx electron-forge make --platform=darwin

# Create macOS installer
npx electron-forge create-installer --platform=darwin

# Build for Linux
npx electron-forge make --platform=linux

# Create Linux installer
npx electron-forge create-installer --platform=linux

# Move installers to separate directories
mkdir -p installers
mv out/make/*.exe installers/windows
mv out/make/*.dmg installers/macos
mv out/make/*.deb installers/linux

# Copy application icon to final build directories
cp src/assets/icon.ico out/make/ || true
cp src/assets/icon.icns out/make/ || true

# Clean up temporary build files
npx electron-forge clean

echo "Build and installer creation completed successfully!"

