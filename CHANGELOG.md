# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased] - 2025 Compatibility Update

### Added
- GitHub Actions CI/CD workflow for automated building and testing
- Gradle Version Catalog (`gradle/libs.versions.toml`) for centralized dependency management
- Modern ProGuard configuration with library-specific rules
- JDK 17 support for builds
- Comprehensive build artifacts and test result uploads in CI

### Changed
- **BREAKING:** Minimum SDK version increased from 10 to 21 (Android 5.0 Lollipop)
- **BREAKING:** Target SDK version updated from 23 to 34 (Android 14)
- **BREAKING:** Migrated from Android Support Library to AndroidX
- **BREAKING:** Compile SDK updated from 23 to 34
- Updated Android Gradle Plugin from 1.3.0 to 8.2.2
- Updated Gradle wrapper from 2.2.1 to 8.5
- Updated build.gradle syntax from `compile` to `implementation`
- MainActivity now extends `AppCompatActivity` instead of `Activity`
- Added namespace declarations to build.gradle files
- Removed package declarations from AndroidManifest.xml files (now using namespace)
- Added Java 8 compatibility configuration
- Updated ProGuard configuration files (.txt → .pro extension)
- Enhanced README with 2025 compatibility information and modern setup instructions

### Fixed
- Build compatibility with modern Android development tools
- Deprecated API usage replaced with current alternatives
- Import statements updated for AndroidX migration

### Technical Details
- **Java Version:** Now requires Java 8+ (added sourceCompatibility/targetCompatibility)
- **Build Tools:** Updated to use modern Android build tools and practices
- **Dependencies:** All test dependencies updated to latest stable versions
- **CI/CD:** Automated testing, linting, and artifact generation
- **Code Quality:** Modern linting rules and automated code quality checks

### Migration Guide

For projects upgrading to this version:

1. **Update your project to AndroidX** if you haven't already
2. **Update minimum SDK** to 21 or higher in your app's build.gradle
3. **Update dependencies** to use `implementation` instead of `compile`
4. **Test thoroughly** as the minimum SDK increase may affect device compatibility

## [0.3.1] - 2015-04-25

### Added
- Initial release with Android Support Library
- WheelView custom view for rotatable item selection
- WheelAdapter for managing wheel items
- Various item transformers (Scaling, Simple, etc.)
- Sample application demonstrating usage