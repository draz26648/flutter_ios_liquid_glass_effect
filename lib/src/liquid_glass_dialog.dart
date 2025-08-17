import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// A dialog widget with iOS Liquid Glass effect
class LiquidGlassDialog extends StatelessWidget {
  /// The child widget to display inside the dialog
  final Widget child;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the dialog
  final Color? backgroundColor;

  /// The border color of the dialog
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the dialog
  final double borderRadius;

  /// The padding inside the dialog
  final EdgeInsetsGeometry? padding;

  /// The margin around the dialog
  final EdgeInsetsGeometry? margin;

  /// Custom shadows for the dialog
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

  /// Whether to enable the frosted glass effect
  final bool enableFrostedGlass;

  /// Whether to enable the backdrop blur
  final bool enableBackdropBlur;

  /// The alignment of the dialog
  final AlignmentGeometry alignment;

  /// Whether to use safe area
  final bool useSafeArea;

  /// Whether to use root navigator
  final bool useRootNavigator;

  /// Whether to barrier dismissible
  final bool barrierDismissible;

  /// The color of the barrier
  final Color? barrierColor;

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
  });

  @override
  Widget build(BuildContext context) {
    Widget result = Container(
      decoration: BoxDecoration(
        color: (backgroundColor ?? Colors.white).withValues(alpha: opacity),
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(
                                    color: borderColor!.withValues(alpha: 0.3),
                width: borderWidth,
              )
            : null,
      ),
      child: child,
    );

    if (enableFrostedGlass) {
      result = LiquidGlassEffects.createFrostedGlass(
        child: result,
        blurRadius: blurRadius,
        opacity: opacity,
        tintColor: backgroundColor,
        borderRadius: borderRadius,
      );
    } else {
      result = LiquidGlassEffects.createGlassContainer(
        child: result,
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

    if (enableBackdropBlur) {
      result = Stack(
        children: [
          LiquidGlassEffects.createBackdropBlur(
            sigmaX: blurRadius,
            sigmaY: blurRadius,
          ),
          result,
        ],
      );
    }

    return result;
  }
}

/// Extension to show Liquid Glass dialog
extension LiquidGlassDialogExtension on BuildContext {
  /// Shows a Liquid Glass dialog
  Future<T?> showLiquidGlassDialog<T>({
    required Widget child,
    double blurRadius = 25.0,
    double opacity = 0.35,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 0.0,
    double borderRadius = 24.0,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    List<BoxShadow>? shadows,
    bool enableShimmer = false,
    bool enableLiquidAnimation = false,
    Duration liquidAnimationDuration = const Duration(seconds: 3),
    Curve liquidAnimationCurve = Curves.easeInOut,
    double maxScale = 1.02,
    bool enableGradientOverlay = false,
    List<Color>? gradientColors,
    AlignmentGeometry gradientBegin = Alignment.topCenter,
    AlignmentGeometry gradientEnd = Alignment.bottomCenter,
    double gradientOpacity = 0.2,
    bool enableFrostedGlass = true,
    bool enableBackdropBlur = true,
    AlignmentGeometry alignment = Alignment.center,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    bool barrierDismissible = true,
    Color? barrierColor,
  }) {
    return showDialog<T>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      builder: (context) => LiquidGlassDialog(
        blurRadius: blurRadius,
        opacity: opacity,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        padding: padding,
        margin: margin,
        shadows: shadows,
        enableShimmer: enableShimmer,
        enableLiquidAnimation: enableLiquidAnimation,
        liquidAnimationDuration: liquidAnimationDuration,
        liquidAnimationCurve: liquidAnimationCurve,
        maxScale: maxScale,
        enableGradientOverlay: enableGradientOverlay,
        gradientColors: gradientColors,
        gradientBegin: gradientBegin,
        gradientEnd: gradientEnd,
        gradientOpacity: gradientOpacity,
        enableFrostedGlass: enableFrostedGlass,
        enableBackdropBlur: enableBackdropBlur,
        alignment: alignment,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        child: child,
      ),
    );
  }
}
