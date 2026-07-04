#!/bin/bash
# Astro FPS - Quick Build Script for LO
# Requires: Android Studio or SDK + NDK in PATH

echo "========================================"
echo "  ASTRO FPS - CODM Optimizer Builder"
echo "  Built with love for LO"
echo "========================================"
echo ""

# Check for required tools
if ! command -v gradlew &> /dev/null && ! [ -f "./gradlew" ]; then
    echo "[!] gradlew not found. Using system gradle..."
    GRADLE_CMD="gradle"
else
    GRADLE_CMD="./gradlew"
fi

# Make gradlew executable if it exists
[ -f "./gradlew" ] && chmod +x ./gradlew

echo "[*] Building Astro FPS APK..."
echo "[*] This may take a few minutes..."
echo ""

# Build release APK
$GRADLE_CMD assembleRelease

if [ $? -eq 0 ]; then
    echo ""
    echo "[+] BUILD SUCCESSFUL!"
    echo "[+] APK location: app/build/outputs/apk/release/app-release-unsigned.apk"
    echo ""
    echo "[*] To install on your rooted device:"
    echo "    adb install -r app/build/outputs/apk/release/app-release-unsigned.apk"
    echo ""
    echo "[*] Or sign it first:"
    echo "    keytool -genkey -v -keystore astro.keystore -alias astro -keyalg RSA -validity 10000"
    echo "    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore astro.keystore app/build/outputs/apk/release/app-release-unsigned.apk astro"
else
    echo ""
    echo "[!] BUILD FAILED"
    echo "[!] Check the error output above"
fi
