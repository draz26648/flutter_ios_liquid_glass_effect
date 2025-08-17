import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// A bottom sheet widget with iOS Liquid Glass effect
class LiquidGlassBottomSheet extends StatelessWidget {
  /// The child widget to display inside the bottom sheet
  final Widget child;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the bottom sheet
  final Color? backgroundColor;

  /// The border color of the bottom sheet
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the bottom sheet
  final double borderRadius;

  /// The padding inside the bottom sheet
  final EdgeInsetsGeometry? padding;

  /// The margin around the bottom sheet
  final EdgeInsetsGeometry? margin;

  /// Custom shadows for the bottom sheet
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

  /// Whether to enable drag to dismiss
  final bool enableDragToDismiss;

  /// Whether to enable the drag handle
  final bool enableDragHandle;

  /// The color of the drag handle
  final Color? dragHandleColor;

  /// The width of the drag handle
  final double dragHandleWidth;

  /// The height of the drag handle
  final double dragHandleHeight;

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
  });

  @override
  Widget build(BuildContext context) {
    Widget result = Container(
      decoration: BoxDecoration(
        color: (backgroundColor ?? Colors.white).withValues(alpha: opacity),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        border: borderColor != null
            ? Border.all(
                                    color: borderColor!.withValues(alpha: 0.3),
                width: borderWidth,
              )
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (enableDragHandle)
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: dragHandleWidth,
                height: dragHandleHeight,
                decoration: BoxDecoration(
                  color: (dragHandleColor ?? Colors.grey).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(dragHandleHeight / 2),
                ),
              ),
            ),
          Flexible(child: child),
        ],
      ),
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

    return result;
  }
}

/// Extension to show Liquid Glass bottom sheet
extension LiquidGlassBottomSheetExtension on BuildContext {
  /// Shows a Liquid Glass bottom sheet
  Future<T?> showLiquidGlassBottomSheet<T>({
    required Widget child,
    double blurRadius = 20.0,
    double opacity = 0.3,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 0.0,
    double borderRadius = 20.0,
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
    double gradientOpacity = 0.15,
    bool enableFrostedGlass = true,
    bool enableDragToDismiss = true,
    bool enableDragHandle = true,
    Color? dragHandleColor,
    double dragHandleWidth = 40.0,
    double dragHandleHeight = 4.0,
    bool isScrollControlled = false,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => LiquidGlassBottomSheet(
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
        enableDragToDismiss: enableDragToDismiss,
        enableDragHandle: enableDragHandle,
        dragHandleColor: dragHandleColor,
        dragHandleWidth: dragHandleWidth,
        dragHandleHeight: dragHandleHeight,
        child: child,
      ),
    );
  }
}
