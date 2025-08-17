# Flutter iOS Liquid Glass - API Documentation

## Table of Contents

1. [LiquidGlassEffects](#liquidglasseffects)
2. [LiquidGlassContainer](#liquidglasscontainer)
3. [LiquidGlassCard](#liquidglasscard)
4. [LiquidGlassButton](#liquidglassbutton)
5. [LiquidGlassAppBar](#liquidglassappbar)
6. [LiquidGlassBottomSheet](#liquidglassbottomsheet)
7. [LiquidGlassDialog](#liquidglassdialog)
8. [LiquidGlassTheme](#liquidglasstheme)
9. [Extensions](#extensions)

---

## LiquidGlassEffects

Core utility class for creating iOS Liquid Glass effects.

### Static Methods

#### `createBackdropBlur`

Creates a backdrop filter with blur effect.

```dart
static BackdropFilter createBackdropBlur({
  double sigmaX = 10.0,
  double sigmaY = 10.0,
  TileMode tileMode = TileMode.clamp,
})
```

**Parameters:**

- `sigmaX` (double): Horizontal blur radius
- `sigmaY` (double): Vertical blur radius
- `tileMode` (TileMode): How to handle edge cases

**Returns:** `BackdropFilter` widget

#### `createGlassContainer`

Creates a glassmorphism container with customizable properties.

```dart
static Container createGlassContainer({
  required Widget child,
  double blurRadius = 10.0,
  double opacity = 0.2,
  Color? backgroundColor,
  Color? borderColor,
  double borderWidth = 1.0,
  double borderRadius = 12.0,
  EdgeInsetsGeometry? padding,
  EdgeInsetsGeometry? margin,
  List<BoxShadow>? shadows,
})
```

**Parameters:**

- `child` (Widget): Required child widget
- `blurRadius` (double): Backdrop blur intensity
- `opacity` (double): Background opacity (0.0 - 1.0)
- `backgroundColor` (Color?): Background color
- `borderColor` (Color?): Border color
- `borderWidth` (double): Border width
- `borderRadius` (double): Corner radius
- `padding` (EdgeInsetsGeometry?): Internal padding
- `margin` (EdgeInsetsGeometry?): External margin
- `shadows` (List<BoxShadow>?): Custom shadows

**Returns:** `Container` widget with glass effects

#### `createGradientOverlay`

Creates a gradient overlay for enhanced glass effect.

```dart
static Container createGradientOverlay({
  required Widget child,
  List<Color>? colors,
  AlignmentGeometry begin = Alignment.topLeft,
  AlignmentGeometry end = Alignment.bottomRight,
  double opacity = 0.1,
})
```

**Parameters:**

- `child` (Widget): Required child widget
- `colors` (List<Color>?): Gradient colors
- `begin` (AlignmentGeometry): Gradient start position
- `end` (AlignmentGeometry): Gradient end position
- `opacity` (double): Gradient opacity

**Returns:** `Container` widget with gradient overlay

#### `createShimmerEffect`

Creates a shimmer effect for dynamic glass appearance.

```dart
static Widget createShimmerEffect({
  required Widget child,
  Duration duration = const Duration(seconds: 2),
  Color shimmerColor = Colors.white,
  double opacity = 0.1,
})
```

**Parameters:**

- `child` (Widget): Required child widget
- `duration` (Duration): Shimmer animation duration
- `shimmerColor` (Color): Shimmer color
- `opacity` (double): Shimmer opacity

**Returns:** `Widget` with shimmer effect

#### `createFrostedGlass`

Creates a frosted glass effect with enhanced blur.

```dart
static Widget createFrostedGlass({
  required Widget child,
  double blurRadius = 15.0,
  double opacity = 0.15,
  Color? tintColor,
  double borderRadius = 16.0,
})
```

**Parameters:**

- `child` (Widget): Required child widget
- `blurRadius` (double): Blur intensity
- `opacity` (double): Background opacity
- `tintColor` (Color?): Tint color
- `borderRadius` (double): Corner radius

**Returns:** `Widget` with frosted glass effect

#### `createLiquidAnimation`

Creates a liquid animation effect.

```dart
static Widget createLiquidAnimation({
  required Widget child,
  Duration duration = const Duration(seconds: 3),
  Curve curve = Curves.easeInOut,
  double maxScale = 1.05,
})
```

**Parameters:**

- `child` (Widget): Required child widget
- `duration` (Duration): Animation duration
- `curve` (Curve): Animation curve
- `maxScale` (double): Maximum scale factor

**Returns:** `Widget` with liquid animation

---

## LiquidGlassContainer

A customizable container with iOS Liquid Glass effect.

### Constructor

```dart
const LiquidGlassContainer({
  super.key,
  required this.child,
  this.blurRadius = 10.0,
  this.opacity = 0.2,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 1.0,
  this.borderRadius = 12.0,
  this.padding,
  this.margin,
  this.shadows,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.05,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topLeft,
  this.gradientEnd = Alignment.bottomRight,
  this.gradientOpacity = 0.1,
})
```

### Properties

| Property                  | Type                  | Default                 | Description             |
| ------------------------- | --------------------- | ----------------------- | ----------------------- |
| `child`                   | `Widget`              | **required**            | Child widget to display |
| `blurRadius`              | `double`              | `10.0`                  | Backdrop blur intensity |
| `opacity`                 | `double`              | `0.2`                   | Background opacity      |
| `backgroundColor`         | `Color?`              | `null`                  | Background color        |
| `borderColor`             | `Color?`              | `null`                  | Border color            |
| `borderWidth`             | `double`              | `1.0`                   | Border width            |
| `borderRadius`            | `double`              | `12.0`                  | Corner radius           |
| `padding`                 | `EdgeInsetsGeometry?` | `null`                  | Internal padding        |
| `margin`                  | `EdgeInsetsGeometry?` | `null`                  | External margin         |
| `shadows`                 | `List<BoxShadow>?`    | `null`                  | Custom shadows          |
| `enableShimmer`           | `bool`                | `false`                 | Enable shimmer effect   |
| `enableLiquidAnimation`   | `bool`                | `false`                 | Enable liquid animation |
| `liquidAnimationDuration` | `Duration`            | `3s`                    | Animation duration      |
| `liquidAnimationCurve`    | `Curve`               | `Curves.easeInOut`      | Animation curve         |
| `maxScale`                | `double`              | `1.05`                  | Maximum scale factor    |
| `enableGradientOverlay`   | `bool`                | `false`                 | Enable gradient overlay |
| `gradientColors`          | `List<Color>?`        | `null`                  | Gradient colors         |
| `gradientBegin`           | `AlignmentGeometry`   | `Alignment.topLeft`     | Gradient start          |
| `gradientEnd`             | `AlignmentGeometry`   | `Alignment.bottomRight` | Gradient end            |
| `gradientOpacity`         | `double`              | `0.1`                   | Gradient opacity        |

---

## LiquidGlassCard

A card widget with iOS Liquid Glass effect and enhanced elevation.

### Constructor

```dart
const LiquidGlassCard({
  super.key,
  required this.child,
  this.blurRadius = 12.0,
  this.opacity = 0.25,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 1.5,
  this.borderRadius = 16.0,
  this.padding,
  this.margin,
  this.shadows,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.05,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topLeft,
  this.gradientEnd = Alignment.bottomRight,
  this.gradientOpacity = 0.15,
  this.enableElevation = true,
  this.elevation = 8.0,
  this.enableFrostedGlass = false,
})
```

### Additional Properties

| Property             | Type     | Default | Description              |
| -------------------- | -------- | ------- | ------------------------ |
| `enableElevation`    | `bool`   | `true`  | Enable elevation effect  |
| `elevation`          | `double` | `8.0`   | Elevation value          |
| `enableFrostedGlass` | `bool`   | `false` | Use frosted glass effect |

---

## LiquidGlassButton

Interactive button with glassmorphism effects and press animations.

### Constructor

```dart
const LiquidGlassButton({
  super.key,
  required this.child,
  this.onPressed,
  this.onLongPress,
  this.blurRadius = 8.0,
  this.opacity = 0.3,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 1.0,
  this.borderRadius = 12.0,
  this.padding,
  this.margin,
  this.shadows,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.05,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topLeft,
  this.gradientEnd = Alignment.bottomRight,
  this.gradientOpacity = 0.1,
  this.enableFrostedGlass = false,
  this.enablePressAnimation = true,
  this.pressScale = 0.95,
  this.pressAnimationDuration = const Duration(milliseconds: 150),
  this.pressAnimationCurve = Curves.easeInOut,
})
```

### Additional Properties

| Property                 | Type            | Default            | Description              |
| ------------------------ | --------------- | ------------------ | ------------------------ |
| `onPressed`              | `VoidCallback?` | `null`             | Press callback           |
| `onLongPress`            | `VoidCallback?` | `null`             | Long press callback      |
| `enablePressAnimation`   | `bool`          | `true`             | Enable press animation   |
| `pressScale`             | `double`        | `0.95`             | Scale when pressed       |
| `pressAnimationDuration` | `Duration`      | `150ms`            | Press animation duration |
| `pressAnimationCurve`    | `Curve`         | `Curves.easeInOut` | Press animation curve    |

---

## LiquidGlassAppBar

App bar with glassmorphism effects and backdrop blur.

### Constructor

```dart
const LiquidGlassAppBar({
  super.key,
  this.title,
  this.leading,
  this.actions,
  this.bottom,
  this.blurRadius = 15.0,
  this.opacity = 0.2,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 0.0,
  this.borderRadius = 0.0,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.02,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topCenter,
  this.gradientEnd = Alignment.bottomCenter,
  this.gradientOpacity = 0.1,
  this.enableFrostedGlass = true,
  this.elevation = 0.0,
  this.height = kToolbarHeight,
})
```

### Additional Properties

| Property    | Type                   | Default          | Description       |
| ----------- | ---------------------- | ---------------- | ----------------- |
| `title`     | `Widget?`              | `null`           | App bar title     |
| `leading`   | `Widget?`              | `null`           | Leading widget    |
| `actions`   | `List<Widget>?`        | `null`           | Action buttons    |
| `bottom`    | `PreferredSizeWidget?` | `null`           | Bottom widget     |
| `elevation` | `double`               | `0.0`            | App bar elevation |
| `height`    | `double`               | `kToolbarHeight` | App bar height    |

---

## LiquidGlassBottomSheet

Bottom sheet with glass effects and drag handle.

### Constructor

```dart
const LiquidGlassBottomSheet({
  super.key,
  required this.child,
  this.blurRadius = 20.0,
  this.opacity = 0.3,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 0.0,
  this.borderRadius = 20.0,
  this.padding,
  this.margin,
  this.shadows,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.02,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topCenter,
  this.gradientEnd = Alignment.bottomCenter,
  this.gradientOpacity = 0.15,
  this.enableFrostedGlass = true,
  this.enableDragToDismiss = true,
  this.enableDragHandle = true,
  this.dragHandleColor,
  this.dragHandleWidth = 40.0,
  this.dragHandleHeight = 4.0,
})
```

### Additional Properties

| Property              | Type     | Default | Description            |
| --------------------- | -------- | ------- | ---------------------- |
| `enableDragToDismiss` | `bool`   | `true`  | Enable drag to dismiss |
| `enableDragHandle`    | `bool`   | `true`  | Show drag handle       |
| `dragHandleColor`     | `Color?` | `null`  | Drag handle color      |
| `dragHandleWidth`     | `double` | `40.0`  | Drag handle width      |
| `dragHandleHeight`    | `double` | `4.0`   | Drag handle height     |

---

## LiquidGlassDialog

Dialog with glass effects and backdrop blur.

### Constructor

```dart
const LiquidGlassDialog({
  super.key,
  required this.child,
  this.blurRadius = 25.0,
  this.opacity = 0.35,
  this.backgroundColor,
  this.borderColor,
  this.borderWidth = 0.0,
  this.borderRadius = 24.0,
  this.padding,
  this.margin,
  this.shadows,
  this.enableShimmer = false,
  this.enableLiquidAnimation = false,
  this.liquidAnimationDuration = const Duration(seconds: 3),
  this.liquidAnimationCurve = Curves.easeInOut,
  this.maxScale = 1.02,
  this.enableGradientOverlay = false,
  this.gradientColors,
  this.gradientBegin = Alignment.topCenter,
  this.gradientEnd = Alignment.bottomCenter,
  this.gradientOpacity = 0.2,
  this.enableFrostedGlass = true,
  this.enableBackdropBlur = true,
  this.alignment = Alignment.center,
  this.useSafeArea = true,
  this.useRootNavigator = true,
  this.barrierDismissible = true,
  this.barrierColor,
})
```

### Additional Properties

| Property             | Type                | Default            | Description          |
| -------------------- | ------------------- | ------------------ | -------------------- |
| `enableBackdropBlur` | `bool`              | `true`             | Enable backdrop blur |
| `alignment`          | `AlignmentGeometry` | `Alignment.center` | Dialog alignment     |
| `useSafeArea`        | `bool`              | `true`             | Use safe area        |
| `useRootNavigator`   | `bool`              | `true`             | Use root navigator   |
| `barrierDismissible` | `bool`              | `true`             | Barrier dismissible  |
| `barrierColor`       | `Color?`            | `null`             | Barrier color        |

---

## LiquidGlassTheme

Theme data for iOS Liquid Glass effects.

### Constructor

```dart
const LiquidGlassTheme({
  this.blurRadius = defaultBlurRadius,
  this.opacity = defaultOpacity,
  this.backgroundColor = defaultBackgroundColor,
  this.borderColor = defaultBorderColor,
  this.borderRadius = defaultBorderRadius,
  this.borderWidth = defaultBorderWidth,
  this.animationDuration = defaultAnimationDuration,
  this.animationCurve = defaultAnimationCurve,
  this.maxScale = defaultMaxScale,
  this.gradientOpacity = defaultGradientOpacity,
  this.shimmerDuration = defaultShimmerDuration,
  this.pressDuration = defaultPressDuration,
  this.pressScale = defaultPressScale,
  this.elevation = defaultElevation,
  this.appBarHeight = defaultAppBarHeight,
  this.bottomSheetRadius = defaultBottomSheetRadius,
  this.dialogRadius = defaultDialogRadius,
  this.dragHandleWidth = defaultDragHandleWidth,
  this.dragHandleHeight = defaultDragHandleHeight,
  this.gradientColors = defaultGradientColors,
  this.shadows = defaultShadows,
})
```

### Methods

#### `copyWith`

Creates a copy of the theme with updated values.

```dart
LiquidGlassTheme copyWith({
  double? blurRadius,
  double? opacity,
  Color? backgroundColor,
  // ... other parameters
})
```

#### `darkTheme`

Creates a dark theme variant.

```dart
LiquidGlassTheme get darkTheme
```

#### `lightTheme`

Creates a light theme variant.

```dart
LiquidGlassTheme get lightTheme
```

#### `colored`

Creates a colored theme variant.

```dart
LiquidGlassTheme colored(Color color)
```

---

## Extensions

### LiquidGlassBottomSheetExtension

Extension methods for showing liquid glass bottom sheets.

#### `showLiquidGlassBottomSheet`

Shows a liquid glass bottom sheet.

```dart
Future<T?> showLiquidGlassBottomSheet<T>({
  required Widget child,
  // ... all LiquidGlassBottomSheet parameters
  bool isScrollControlled = false,
  bool isDismissible = true,
  bool enableDrag = true,
})
```

### LiquidGlassDialogExtension

Extension methods for showing liquid glass dialogs.

#### `showLiquidGlassDialog`

Shows a liquid glass dialog.

```dart
Future<T?> showLiquidGlassDialog<T>({
  required Widget child,
  // ... all LiquidGlassDialog parameters
})
```

---

## Usage Examples

### Basic Container

```dart
LiquidGlassContainer(
  child: Text('Hello, Liquid Glass!'),
  blurRadius: 10.0,
  opacity: 0.2,
)
```

### Interactive Button

```dart
LiquidGlassButton(
  onPressed: () => print('Pressed!'),
  child: Text('Press Me'),
  enablePressAnimation: true,
  enableShimmer: true,
)
```

### Themed Components

```dart
final theme = LiquidGlassTheme(
  blurRadius: 20.0,
  opacity: 0.3,
  backgroundColor: Colors.blue,
);

LiquidGlassContainer(
  child: Text('Themed Container'),
  blurRadius: theme.blurRadius,
  opacity: theme.opacity,
  backgroundColor: theme.backgroundColor,
)
```

### Custom Effects

```dart
LiquidGlassEffects.createFrostedGlass(
  child: Text('Frosted Glass'),
  blurRadius: 25.0,
  opacity: 0.3,
  borderRadius: 20.0,
)
```

---

## Performance Considerations

- Use moderate blur radius values (10-25) for best performance
- Disable unnecessary animations on low-end devices
- Limit the number of shadow layers
- Keep opacity values between 0.1-0.4 for optimal visual effect
- Use `enableFrostedGlass` for better performance on iOS

---

## Platform Support

- ✅ **iOS**: Full support with native performance
- ✅ **Android**: Full support with Flutter rendering
- ✅ **Web**: Full support with web-optimized effects
- ✅ **Desktop**: Full support across all platforms
