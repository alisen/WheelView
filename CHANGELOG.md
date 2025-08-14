# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] - 2025-01-01

### Added
- Kotlin support for better modern Android development
- GitHub Actions CI/CD workflow for automated builds and tests
- Dependabot configuration for automatic dependency updates
- EditorConfig for consistent code formatting
- View binding support in sample app
- Consumer ProGuard rules for library
- Maven publishing configuration

### Changed
- **BREAKING**: Minimum SDK version increased from 10 to 21 (Android 5.0)
- Target SDK updated to 35 (Android 15)
- Compile SDK updated to 35 (Android 15)
- Migrated from Android Support Library to AndroidX
- Updated to Gradle 8.7
- Updated to Android Gradle Plugin 8.7.3
- Updated to Java 17 as the target JVM version
- Modernized build configuration with namespace support
- Improved ProGuard configuration

### Removed
- Removed deprecated `compile` configuration in favor of `implementation`
- Removed package attribute from AndroidManifest files (using namespace in build.gradle)

## [0.3.1] - Previous Release

### Features
- WheelView widget for rotatable item selection
- Customizable wheel appearance
- Item click and selection listeners
- Support for repeating items
- Various transformation options

[0.4.0]: https://github.com/LukeDeighton/WheelView/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/LukeDeighton/WheelView/releases/tag/v0.3.1