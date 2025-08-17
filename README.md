# Flutter iOS Liquid Glass

A Flutter package that implements the iOS Liquid Glass effect, providing beautiful glassmorphism UI components with customizable blur, transparency, and backdrop effects.

[![pub package](https://img.shields.io/pub/v/flutter_ios_liquidglass.svg)](https://pub.dev/packages/flutter_ios_liquidglass)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

✨ **Glassmorphism Effects**: Beautiful backdrop blur and transparency effects  
🎨 **Customizable**: Extensive customization options for colors, blur, opacity, and more  
🚀 **Performance Optimized**: Efficient rendering with minimal performance impact  
📱 **iOS Native Feel**: Authentic iOS design language and interactions  
🎭 **Multiple Components**: Container, Card, Button, AppBar, BottomSheet, and Dialog  
✨ **Animations**: Built-in liquid animations and shimmer effects  
🎨 **Theme Support**: Consistent theming across all components  
🔧 **Easy to Use**: Simple API with sensible defaults  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_ios_liquidglass: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:flutter_ios_liquidglass/flutter_ios_liquidglass.dart';

// Basic usage
LiquidGlassContainer(
  child: Text('Hello, Liquid Glass!'),
  blurRadius: 10.0,
  opacity: 0.2,
)
```

## Components

### 1. LiquidGlassContainer

A versatile container with glassmorphism effects.

```dart
LiquidGlassContainer(
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
      'Glass Container',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  blurRadius: 15.0,
  opacity: 0.25,
  backgroundColor: Colors.white,
  borderColor: Colors.white,
  borderRadius: 16.0,
  enableShimmer: true,
  enableLiquidAnimation: true,
)
```

### 2. LiquidGlassCard

A card widget with enhanced glass effects and elevation.

```dart
LiquidGlassCard(
  child: Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        Icon(Icons.star, size: 48, color: Colors.amber),
        SizedBox(height: 16),
        Text('Premium Feature', style: TextStyle(fontSize: 20)),
        Text('Enhanced with liquid glass effects'),
      ],
    ),
  ),
  enableFrostedGlass: true,
  enableGradientOverlay: true,
  gradientColors: [Colors.blue.withOpacity(0.1), Colors.purple.withOpacity(0.1)],
)
```

### 3. LiquidGlassButton

Interactive button with press animations and glass effects.

```dart
LiquidGlassButton(
  onPressed: () => print('Button pressed!'),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    child: Text('Press Me', style: TextStyle(fontSize: 16)),
  ),
  enablePressAnimation: true,
  pressScale: 0.95,
  enableShimmer: true,
)
```

### 4. LiquidGlassAppBar

App bar with glassmorphism effects and backdrop blur.

```dart
LiquidGlassAppBar(
  title: Text('Liquid Glass App'),
  backgroundColor: Colors.white,
  enableFrostedGlass: true,
  enableGradientOverlay: true,
  actions: [
    IconButton(icon: Icon(Icons.settings), onPressed: () {}),
  ],
)
```

### 5. LiquidGlassBottomSheet

Bottom sheet with glass effects and drag handle.

```dart
// Show bottom sheet
context.showLiquidGlassBottomSheet(
  child: Padding(
    padding: EdgeInsets.all(20.0),
    child: Text('This is a liquid glass bottom sheet!'),
  ),
  enableFrostedGlass: true,
  enableDragHandle: true,
  borderRadius: 24.0,
)
```

### 6. LiquidGlassDialog

Dialog with glass effects and backdrop blur.

```dart
// Show dialog
context.showLiquidGlassDialog(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Liquid Glass Dialog', style: TextStyle(fontSize: 20)),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  ),
  enableBackdropBlur: true,
  enableFrostedGlass: true,
)
```

## Advanced Usage

### Custom Themes

```dart
final customTheme = LiquidGlassTheme(
  blurRadius: 20.0,
  opacity: 0.3,
  backgroundColor: Colors.blue,
  borderColor: Colors.blue,
  borderRadius: 20.0,
  enableShimmer: true,
  enableLiquidAnimation: true,
);

// Use theme with components
LiquidGlassContainer(
  child: Text('Custom Theme'),
  blurRadius: customTheme.blurRadius,
  opacity: customTheme.opacity,
  backgroundColor: customTheme.backgroundColor,
)
```

### Custom Effects

```dart
// Create custom glass container
LiquidGlassEffects.createGlassContainer(
  child: Text('Custom Effect'),
  blurRadius: 25.0,
  opacity: 0.4,
  backgroundColor: Colors.purple,
  borderColor: Colors.purple,
  borderRadius: 20.0,
  shadows: [
    BoxShadow(
      color: Colors.purple.withOpacity(0.3),
      blurRadius: 30,
      spreadRadius: 0,
      offset: Offset(0, 15),
    ),
  ],
)

// Create frosted glass effect
LiquidGlassEffects.createFrostedGlass(
  child: Text('Frosted Glass'),
  blurRadius: 30.0,
  opacity: 0.2,
  tintColor: Colors.white,
  borderRadius: 25.0,
)

// Create shimmer effect
LiquidGlassEffects.createShimmerEffect(
  child: Text('Shimmer Effect'),
  duration: Duration(seconds: 3),
  shimmerColor: Colors.white,
  opacity: 0.15,
)
```

## Configuration Options

### Common Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `blurRadius` | `double` | `10.0` | Backdrop blur intensity |
| `opacity` | `double` | `0.2` | Background opacity |
| `backgroundColor` | `Color?` | `Colors.white` | Background color |
| `borderColor` | `Color?` | `null` | Border color |
| `borderWidth` | `double` | `1.0` | Border width |
| `borderRadius` | `double` | `12.0` | Corner radius |
| `padding` | `EdgeInsetsGeometry?` | `null` | Internal padding |
| `margin` | `EdgeInsetsGeometry?` | `null` | External margin |

### Effect Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `enableShimmer` | `bool` | `false` | Enable shimmer animation |
| `enableLiquidAnimation` | `bool` | `false` | Enable liquid scale animation |
| `enableGradientOverlay` | `bool` | `false` | Enable gradient overlay |
| `enableFrostedGlass` | `bool` | `false` | Use frosted glass effect |
| `enablePressAnimation` | `bool` | `true` | Enable press animations |

### Animation Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `liquidAnimationDuration` | `Duration` | `3s` | Liquid animation duration |
| `liquidAnimationCurve` | `Curve` | `Curves.easeInOut` | Liquid animation curve |
| `maxScale` | `double` | `1.05` | Maximum scale for liquid animation |
| `pressScale` | `double` | `0.95` | Scale factor when pressed |
| `pressAnimationDuration` | `Duration` | `150ms` | Press animation duration |

## Examples

### Complete App Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_ios_liquidglass/flutter_ios_liquidglass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Glass Demo',
      theme: ThemeData.dark(),
      home: LiquidGlassDemo(),
    );
  }
}

class LiquidGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[900]!, Colors.purple[900]!],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                LiquidGlassAppBar(
                  title: Text('Liquid Glass Demo'),
                  enableFrostedGlass: true,
                ),
                SizedBox(height: 20),
                LiquidGlassCard(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Welcome to the future of UI design!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  enableFrostedGlass: true,
                  enableShimmer: true,
                ),
                SizedBox(height: 20),
                LiquidGlassButton(
                  onPressed: () {
                    context.showLiquidGlassDialog(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text('Hello from Liquid Glass!'),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text('Show Dialog'),
                  ),
                  enablePressAnimation: true,
                  enableShimmer: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Performance Considerations

- **Backdrop Filter**: Use moderate blur radius values (10-25) for best performance
- **Animations**: Disable unnecessary animations on low-end devices
- **Shadows**: Limit the number of shadow layers for better performance
- **Opacity**: Keep opacity values between 0.1-0.4 for optimal visual effect

## Platform Support

- ✅ **iOS**: Full support with native performance
- ✅ **Android**: Full support with Flutter rendering
- ✅ **Web**: Full support with web-optimized effects
- ✅ **Desktop**: Full support across all platforms

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by iOS design principles and glassmorphism trends
- Built with Flutter's powerful rendering engine
- Special thanks to the Flutter community for inspiration and feedback

## Support

If you encounter any issues or have questions, please:

1. Check the [documentation](https://pub.dev/packages/flutter_ios_liquidglass)
2. Search existing [issues](https://github.com/yourusername/flutter_ios_liquidglass/issues)
3. Create a new issue with detailed information

---

**Made with ❤️ for the Flutter community**
