import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// A customizable container with iOS Liquid Glass effect
class LiquidGlassContainer extends StatelessWidget {
  /// The child widget to display inside the container
  final Widget child;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the container
  final Color? backgroundColor;

  /// The border color of the container
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the container
  final double borderRadius;

  /// The padding inside the container
  final EdgeInsetsGeometry? padding;

  /// The margin around the container
  final EdgeInsetsGeometry? margin;

  /// Custom shadows for the container
  final List<BoxShadow>? shadows;

  /// Whether to enable the shimmer effect
  final bool enableShimmer;

  /// Whether to enable the liquid animation
  final bool enableLiquidAnimation;

  /// The duration of the liquid animation
  final Duration liquidAnimationDuration;

  /// The curve for the liquid animation
  final Curve liquidAnimationCurve;

  /// The maximum scale for the liquid animation
  final double maxScale;

  /// Whether to enable the gradient overlay
  final bool enableGradientOverlay;

  /// Custom gradient colors for the overlay
  final List<Color>? gradientColors;

  /// The alignment for the gradient start
  final AlignmentGeometry gradientBegin;

  /// The alignment for the gradient end
  final AlignmentGeometry gradientEnd;

  /// The opacity of the gradient overlay
  final double gradientOpacity;

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
  });

  @override
  Widget build(BuildContext context) {
    Widget result = LiquidGlassEffects.createGlassContainer(
      child: child,
      blurRadius: blurRadius,
      opacity: opacity,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      shadows: shadows,
    );

    if (enableGradientOverlay) {
      result = LiquidGlassEffects.createGradientOverlay(
        child: result,
        colors: gradientColors,
        begin: gradientBegin,
        end: gradientEnd,
        opacity: gradientOpacity,
      );
    }

    if (enableShimmer) {
      result = LiquidGlassEffects.createShimmerEffect(
        child: result,
      );
    }

    if (enableLiquidAnimation) {
      result = LiquidGlassEffects.createLiquidAnimation(
        child: result,
        duration: liquidAnimationDuration,
        curve: liquidAnimationCurve,
        maxScale: maxScale,
      );
    }

    return result;
  }
}
