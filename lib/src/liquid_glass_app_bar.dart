import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// An app bar widget with iOS Liquid Glass effect
class LiquidGlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title widget to display in the app bar
  final Widget? title;

  /// The leading widget to display at the start of the app bar
  final Widget? leading;

  /// The actions to display at the end of the app bar
  final List<Widget>? actions;

  /// The bottom widget to display below the app bar
  final PreferredSizeWidget? bottom;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the app bar
  final Color? backgroundColor;

  /// The border color of the app bar
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the app bar
  final double borderRadius;

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

  /// The elevation of the app bar
  final double elevation;

  /// The height of the app bar
  final double height;

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
  });

  @override
  Widget build(BuildContext context) {
    Widget result = SizedBox(
      height: height,
      child: AppBar(
        title: title,
        leading: leading,
        actions: actions,
        bottom: bottom,
        backgroundColor: Colors.transparent,
        elevation: elevation,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: (backgroundColor ?? Colors.white).withValues(alpha: opacity),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!.withValues(alpha: 0.3),
                    width: borderWidth,
                  )
                : null,
          ),
        ),
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
        shadows: <BoxShadow>[
          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: elevation,
            spreadRadius: 0,
            offset: Offset(0, elevation / 2),
          ),
        ],
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

  @override
  Size get preferredSize => Size.fromHeight(height);
}
