# Contributing to Flutter iOS Liquid Glass

Thank you for your interest in contributing to the Flutter iOS Liquid Glass package! This document provides guidelines and information for contributors.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Code Style Guidelines](#code-style-guidelines)
- [Testing Guidelines](#testing-guidelines)
- [Documentation Guidelines](#documentation-guidelines)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

- Use the GitHub issue tracker
- Include detailed steps to reproduce the bug
- Provide Flutter and Dart version information
- Include device/platform information if relevant
- Add screenshots or videos if applicable

### Suggesting Enhancements

- Use the GitHub issue tracker with the "enhancement" label
- Describe the enhancement clearly
- Explain why this enhancement would be useful
- Provide examples of how it would work

### Contributing Code

- Fork the repository
- Create a feature branch
- Make your changes
- Add tests for new functionality
- Ensure all tests pass
- Submit a pull request

## Development Setup

### Prerequisites

- Flutter SDK 3.16.0 or higher
- Dart SDK 3.8.1 or higher
- Git

### Setup Steps

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/flutter_ios_liquid_glass_effect.git
   cd flutter_ios_liquid_glass_effect
   ```

3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/draz26648/flutter_ios_liquid_glass_effect.git
   ```

4. Install dependencies:
   ```bash
   flutter pub get
   cd example && flutter pub get && cd ..
   ```

5. Run tests to ensure everything works:
   ```bash
   flutter test
   flutter analyze lib/
   ```

## Pull Request Process

1. **Create a feature branch** from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the code style guidelines

3. **Add tests** for new functionality

4. **Update documentation** if needed

5. **Run tests** to ensure everything works:
   ```bash
   flutter test
   flutter analyze lib/
   ```

6. **Commit your changes** with clear commit messages:
   ```bash
   git commit -m "feat: add new liquid glass effect"
   git commit -m "fix: resolve void expression error in button"
   git commit -m "docs: update API documentation"
   ```

7. **Push your branch**:
   ```bash
   git push origin feature/your-feature-name
   ```

8. **Create a pull request** with:
   - Clear title and description
   - Reference to related issues
   - Screenshots if UI changes
   - Test results

## Code Style Guidelines

### Dart/Flutter Style

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for style issues
- Follow Flutter conventions for widget structure

### Naming Conventions

- **Classes**: PascalCase (e.g., `LiquidGlassContainer`)
- **Variables and methods**: camelCase (e.g., `blurRadius`, `enableShimmer`)
- **Constants**: lowerCamelCase (e.g., `defaultBlurRadius`)
- **Files**: snake_case (e.g., `liquid_glass_container.dart`)

### Code Organization

- Keep classes focused and single-purpose
- Use meaningful variable and method names
- Add comprehensive documentation for public APIs
- Group related functionality together

### Example Code Structure

```dart
/// A container widget with iOS Liquid Glass effect
class LiquidGlassContainer extends StatelessWidget {
  /// The child widget to display inside the container
  final Widget child;
  
  /// The blur radius for the backdrop filter
  final double blurRadius;
  
  // ... other properties
  
  const LiquidGlassContainer({
    super.key,
    required this.child,
    this.blurRadius = 10.0,
    // ... other parameters
  });
  
  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}
```

## Testing Guidelines

### Test Coverage

- Aim for at least 80% test coverage
- Test all public methods and constructors
- Test edge cases and error conditions
- Test widget rendering and interactions

### Test Structure

```dart
group('LiquidGlassContainer Tests', () {
  testWidgets('renders with default properties', (WidgetTester tester) async {
    final container = LiquidGlassContainer(
      child: Text('Test Container'),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: container),
    ));

    expect(find.text('Test Container'), findsOneWidget);
  });
});
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/liquid_glass_container_test.dart
```

## Documentation Guidelines

### API Documentation

- Document all public classes, methods, and properties
- Use clear, concise descriptions
- Include usage examples
- Document parameters and return values

### README Updates

- Update README.md for new features
- Include code examples
- Update installation instructions if needed
- Keep the changelog current

### Code Comments

- Use `///` for documentation comments
- Explain complex logic
- Document assumptions and limitations
- Keep comments up-to-date with code changes

## Release Process

### Version Bumping

- Update version in `pubspec.yaml`
- Update `CHANGELOG.md` with new version
- Create a git tag for the release

### Publishing

- Ensure all tests pass
- Run `flutter analyze` with no issues
- Update documentation
- Create release notes
- Publish to pub.dev

## Getting Help

If you need help with contributing:

- Check existing issues and pull requests
- Ask questions in GitHub discussions
- Review the code and documentation
- Contact the maintainers

## Thank You

Thank you for contributing to Flutter iOS Liquid Glass! Your contributions help make this package better for the entire Flutter community.

---

**Happy coding! 🚀**
