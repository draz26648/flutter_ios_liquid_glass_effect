import 'package:flutter/material.dart';

/// Theme data for iOS Liquid Glass effects
class LiquidGlassTheme {
  /// Default blur radius for glass effects
  static const double defaultBlurRadius = 10.0;

  /// Default opacity for glass backgrounds
  static const double defaultOpacity = 0.2;

  /// Default border radius for glass containers
  static const double defaultBorderRadius = 12.0;

  /// Default border width for glass containers
  static const double defaultBorderWidth = 1.0;

  /// Default animation duration for liquid effects
  static const Duration defaultAnimationDuration = Duration(seconds: 3);

  /// Default animation curve for liquid effects
  static const Curve defaultAnimationCurve = Curves.easeInOut;

  /// Default maximum scale for liquid animations
  static const double defaultMaxScale = 1.05;

  /// Default gradient opacity for overlays
  static const double defaultGradientOpacity = 0.1;

  /// Default shimmer duration
  static const Duration defaultShimmerDuration = Duration(seconds: 2);

  /// Default press animation duration
  static const Duration defaultPressDuration = Duration(milliseconds: 150);

  /// Default press scale factor
  static const double defaultPressScale = 0.95;

  /// Default elevation for cards
  static const double defaultElevation = 8.0;

  /// Default app bar height
  static const double defaultAppBarHeight = kToolbarHeight;

  /// Default bottom sheet border radius
  static const double defaultBottomSheetRadius = 20.0;

  /// Default dialog border radius
  static const double defaultDialogRadius = 24.0;

  /// Default drag handle dimensions
  static const double defaultDragHandleWidth = 40.0;
  static const double defaultDragHandleHeight = 4.0;

  /// Default colors for glass effects
  static const Color defaultBackgroundColor = Colors.white;
  static const Color defaultBorderColor = Colors.white;
  static const Color defaultDragHandleColor = Colors.grey;

  /// Default gradient colors
  static const List<Color> defaultGradientColors = [
    Colors.white,
    Colors.transparent,
  ];

  /// Default shadows for glass containers
  static const List<BoxShadow> defaultShadows = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 20,
      spreadRadius: 0,
      offset: Offset(0, 10),
    ),
  ];

  /// Creates a custom glass theme with the specified parameters
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
  });

  /// The blur radius for glass effects
  final double blurRadius;

  /// The opacity for glass backgrounds
  final double opacity;

  /// The background color for glass containers
  final Color backgroundColor;

  /// The border color for glass containers
  final Color borderColor;

  /// The border radius for glass containers
  final double borderRadius;

  /// The border width for glass containers
  final double borderWidth;

  /// The animation duration for liquid effects
  final Duration animationDuration;

  /// The animation curve for liquid effects
  final Curve animationCurve;

  /// The maximum scale for liquid animations
  final double maxScale;

  /// The gradient opacity for overlays
  final double gradientOpacity;

  /// The shimmer duration
  final Duration shimmerDuration;

  /// The press animation duration
  final Duration pressDuration;

  /// The press scale factor
  final double pressScale;

  /// The elevation for cards
  final double elevation;

  /// The app bar height
  final double appBarHeight;

  /// The bottom sheet border radius
  final double bottomSheetRadius;

  /// The dialog border radius
  final double dialogRadius;

  /// The drag handle width
  final double dragHandleWidth;

  /// The drag handle height
  final double dragHandleHeight;

  /// The gradient colors
  final List<Color> gradientColors;

  /// The shadows for glass containers
  final List<BoxShadow> shadows;

  /// Creates a copy of this theme with the specified parameters replaced
  LiquidGlassTheme copyWith({
    double? blurRadius,
    double? opacity,
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    double? borderWidth,
    Duration? animationDuration,
    Curve? animationCurve,
    double? maxScale,
    double? gradientOpacity,
    Duration? shimmerDuration,
    Duration? pressDuration,
    double? pressScale,
    double? elevation,
    double? appBarHeight,
    double? bottomSheetRadius,
    double? dialogRadius,
    double? dragHandleWidth,
    double? dragHandleHeight,
    List<Color>? gradientColors,
    List<BoxShadow>? shadows,
  }) {
    return LiquidGlassTheme(
      blurRadius: blurRadius ?? this.blurRadius,
      opacity: opacity ?? this.opacity,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      maxScale: maxScale ?? this.maxScale,
      gradientOpacity: gradientOpacity ?? this.gradientOpacity,
      shimmerDuration: shimmerDuration ?? this.shimmerDuration,
      pressDuration: pressDuration ?? this.pressDuration,
      pressScale: pressScale ?? this.pressScale,
      elevation: elevation ?? this.elevation,
      appBarHeight: appBarHeight ?? this.appBarHeight,
      bottomSheetRadius: bottomSheetRadius ?? this.bottomSheetRadius,
      dialogRadius: dialogRadius ?? this.dialogRadius,
      dragHandleWidth: dragHandleWidth ?? this.dragHandleWidth,
      dragHandleHeight: dragHandleHeight ?? this.dragHandleHeight,
      gradientColors: gradientColors ?? this.gradientColors,
      shadows: shadows ?? this.shadows,
    );
  }

  /// Creates a dark theme variant
  LiquidGlassTheme get darkTheme {
    return copyWith(
      backgroundColor: Colors.black,
      borderColor: Colors.white,
      gradientColors: [
        Colors.white.withValues(alpha: 0.1),
        Colors.transparent,
      ],
      shadows: [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.3),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  /// Creates a light theme variant
  LiquidGlassTheme get lightTheme {
    return copyWith(
      backgroundColor: Colors.white,
      borderColor: Colors.black,
      gradientColors: [
        Colors.black.withValues(alpha: 0.05),
        Colors.transparent,
      ],
      shadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  /// Creates a colored theme variant
  LiquidGlassTheme colored(Color color) {
    return copyWith(
      backgroundColor: color,
      borderColor: color,
      gradientColors: [
        color.withValues(alpha: 0.1),
        Colors.transparent,
      ],
    );
  }
}
