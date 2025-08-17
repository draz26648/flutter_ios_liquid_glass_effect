import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// A card widget with iOS Liquid Glass effect
class LiquidGlassCard extends StatelessWidget {
  /// The child widget to display inside the card
  final Widget child;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the card
  final Color? backgroundColor;

  /// The border color of the card
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the card
  final double borderRadius;

  /// The padding inside the card
  final EdgeInsetsGeometry? padding;

  /// The margin around the card
  final EdgeInsetsGeometry? margin;

  /// Custom shadows for the card
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

  /// Whether to enable elevation effect
  final bool enableElevation;

  /// The elevation value for the card
  final double elevation;

  /// Whether to enable the frosted glass effect
  final bool enableFrostedGlass;

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
  });

  @override
  Widget build(BuildContext context) {
    Widget result;

    if (enableFrostedGlass) {
      result = LiquidGlassEffects.createFrostedGlass(
        child: child,
        blurRadius: blurRadius,
        opacity: opacity,
        tintColor: backgroundColor,
        borderRadius: borderRadius,
      );
    } else {
      result = LiquidGlassEffects.createGlassContainer(
        child: child,
        blurRadius: blurRadius,
        opacity: opacity,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        padding: padding,
        margin: margin,
        shadows: shadows ?? (enableElevation ? <BoxShadow>[
          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: elevation,
            spreadRadius: 0,
            offset: Offset(0, elevation / 2),
          ),
        ] : null),
      );
    }

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
