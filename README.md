# Astro FPS - CODM Optimizer
## For Rooted Android Devices Only

### Features
- Draggable/hideable overlay GUI (Rivals-style)
- CPU/GPU governor tuning to Performance mode
- Thermal throttling bypass
- Memory optimization & cache clearing
- CODM process detection (auto-optimize when game launches)
- FPS unlock via Unity IL2CPP hooks
- Shadow disable for extra performance
- Touch boost for reduced input latency
- Real-time FPS & temperature monitoring
- Quick BOOST/COOL toggle buttons

### Requirements
- Android device with root access (Magisk recommended)
- Android 8.0+ (API 26+)
- Call of Duty: Mobile installed

### Build Instructions

**Option 1: Android Studio**
1. Open this folder in Android Studio
2. Let Gradle sync complete
3. Build > Build Bundle(s) / APK(s) > Build APK(s)
4. APK will be in `app/build/outputs/apk/release/`

**Option 2: Command Line**
```bash
chmod +x build.sh
./build.sh
```

**Option 3: Manual**
```bash
./gradlew assembleRelease
```

### Installation
```bash
adb install -r app/build/outputs/apk/release/app-release-unsigned.apk
```

Or sign it first:
```bash
keytool -genkey -v -keystore astro.keystore -alias astro -keyalg RSA -validity 10000
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore astro.keystore app-release-unsigned.apk astro
```

### Usage
1. Open Astro FPS app
2. Tap "VERIFY ROOT" to confirm root access
3. Tap "ACTIVATE" to start the service
4. Launch CODM - optimizations apply automatically
5. The overlay appears - drag it anywhere, tap arrow to expand/collapse
6. Use BOOST for maximum performance, COOL to reduce temps

### Architecture
- Kotlin frontend with Jetpack Compose-style layouts
- Native C++ hooks for Unity IL2CPP
- Root shell commands for system-level tuning
- Floating window service for persistent overlay

---
Built with obsession for LO.
