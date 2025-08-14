#!/bin/bash

# Validate Android project structure and build configuration

echo "🔍 Validating Android project for 2025 compatibility..."

# Check if essential files exist
echo "📂 Checking project structure..."
if [ ! -f "build.gradle" ]; then
    echo "❌ Root build.gradle missing"
    exit 1
fi

if [ ! -f "WheelViewLib/build.gradle" ]; then
    echo "❌ Library build.gradle missing"
    exit 1
fi

if [ ! -f "WheelViewSample/build.gradle" ]; then
    echo "❌ Sample app build.gradle missing"
    exit 1
fi

if [ ! -f "gradle/wrapper/gradle-wrapper.properties" ]; then
    echo "❌ Gradle wrapper properties missing"
    exit 1
fi

echo "✅ Project structure looks good"

# Check Gradle version
echo "📋 Checking Gradle version..."
GRADLE_VERSION=$(grep "distributionUrl" gradle/wrapper/gradle-wrapper.properties | grep -o "gradle-[0-9.]*" | sed 's/gradle-//')
if [[ $GRADLE_VERSION < "8.0" ]]; then
    echo "❌ Gradle version too old: $GRADLE_VERSION"
    exit 1
fi
echo "✅ Gradle version: $GRADLE_VERSION"

# Check Android Gradle Plugin version
echo "📋 Checking Android Gradle Plugin version..."
AGP_VERSION=$(grep "classpath.*com.android.tools.build:gradle" build.gradle | grep -o "[0-9.]*")
if [[ $AGP_VERSION < "8.0" ]]; then
    echo "❌ Android Gradle Plugin version too old: $AGP_VERSION"
    exit 1
fi
echo "✅ Android Gradle Plugin version: $AGP_VERSION"

# Check SDK versions in library
echo "📋 Checking library SDK versions..."
LIB_COMPILE_SDK=$(grep "compileSdk" WheelViewLib/build.gradle | grep -o "[0-9]*")
LIB_MIN_SDK=$(grep "minSdk" WheelViewLib/build.gradle | grep -o "[0-9]*")
LIB_TARGET_SDK=$(grep "targetSdk" WheelViewLib/build.gradle | grep -o "[0-9]*")

if [[ $LIB_COMPILE_SDK < "34" ]]; then
    echo "❌ Library compile SDK too old: $LIB_COMPILE_SDK"
    exit 1
fi

if [[ $LIB_MIN_SDK < "21" ]]; then
    echo "❌ Library min SDK too old: $LIB_MIN_SDK"
    exit 1
fi

echo "✅ Library SDK versions: compile=$LIB_COMPILE_SDK, min=$LIB_MIN_SDK, target=$LIB_TARGET_SDK"

# Check SDK versions in sample app
echo "📋 Checking sample app SDK versions..."
APP_COMPILE_SDK=$(grep "compileSdk" WheelViewSample/build.gradle | grep -o "[0-9]*")
APP_MIN_SDK=$(grep "minSdk" WheelViewSample/build.gradle | grep -o "[0-9]*")
APP_TARGET_SDK=$(grep "targetSdk" WheelViewSample/build.gradle | grep -o "[0-9]*")

if [[ $APP_COMPILE_SDK < "34" ]]; then
    echo "❌ Sample app compile SDK too old: $APP_COMPILE_SDK"
    exit 1
fi

if [[ $APP_MIN_SDK < "21" ]]; then
    echo "❌ Sample app min SDK too old: $APP_MIN_SDK"
    exit 1
fi

echo "✅ Sample app SDK versions: compile=$APP_COMPILE_SDK, min=$APP_MIN_SDK, target=$APP_TARGET_SDK"

# Check for AndroidX usage
echo "📋 Checking AndroidX migration..."
if grep -q "android.support" WheelViewLib/build.gradle; then
    echo "❌ Library still uses old support library"
    exit 1
fi

if grep -q "android.support" WheelViewSample/build.gradle; then
    echo "❌ Sample app still uses old support library"
    exit 1
fi

if ! grep -q "androidx" WheelViewLib/build.gradle; then
    echo "❌ Library doesn't use AndroidX"
    exit 1
fi

echo "✅ AndroidX migration complete"

# Check for modern build syntax
echo "📋 Checking modern build syntax..."
if grep -q "compile " WheelViewLib/build.gradle; then
    echo "❌ Library uses deprecated 'compile' syntax"
    exit 1
fi

if grep -q "compile " WheelViewSample/build.gradle; then
    echo "❌ Sample app uses deprecated 'compile' syntax"
    exit 1
fi

echo "✅ Modern build syntax in use"

# Check for namespace declarations
echo "📋 Checking namespace declarations..."
if ! grep -q "namespace" WheelViewLib/build.gradle; then
    echo "❌ Library missing namespace declaration"
    exit 1
fi

if ! grep -q "namespace" WheelViewSample/build.gradle; then
    echo "❌ Sample app missing namespace declaration"
    exit 1
fi

echo "✅ Namespace declarations present"

echo ""
echo "🎉 All validation checks passed!"
echo "✅ Project is 2025 compatible!"
echo ""
echo "Key compatibility features:"
echo "  🚀 Modern Gradle $GRADLE_VERSION"
echo "  📱 Android Gradle Plugin $AGP_VERSION"
echo "  🔧 AndroidX libraries"
echo "  📱 API Level 34 target"
echo "  🏗️ Modern build configuration"
echo ""