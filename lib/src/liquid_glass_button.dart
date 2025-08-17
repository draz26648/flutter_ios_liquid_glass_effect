import 'package:flutter/material.dart';
import 'liquid_glass_effects.dart';

/// A button widget with iOS Liquid Glass effect
class LiquidGlassButton extends StatefulWidget {
  /// The child widget to display inside the button
  final Widget child;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// Callback function when the button is long pressed
  final VoidCallback? onLongPress;

  /// The blur radius for the backdrop filter
  final double blurRadius;

  /// The opacity of the background color
  final double opacity;

  /// The background color of the button
  final Color? backgroundColor;

  /// The border color of the button
  final Color? borderColor;

  /// The width of the border
  final double borderWidth;

  /// The border radius of the button
  final double borderRadius;

  /// The padding inside the button
  final EdgeInsetsGeometry? padding;

  /// The margin around the button
  final EdgeInsetsGeometry? margin;

  /// Custom shadows for the button
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

  /// Whether to enable press animation
  final bool enablePressAnimation;

  /// The scale factor when pressed
  final double pressScale;

  /// The duration of the press animation
  final Duration pressAnimationDuration;

  /// The curve for the press animation
  final Curve pressAnimationCurve;

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
  });

  @override
  State<LiquidGlassButton> createState() => _LiquidGlassButtonState();
}

class _LiquidGlassButtonState extends State<LiquidGlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressController;
  late Animation<double> _pressAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      duration: widget.pressAnimationDuration,
      vsync: this,
    );
    _pressAnimation = Tween<double>(begin: 1.0, end: widget.pressScale).animate(
      CurvedAnimation(
        parent: _pressController,
        curve: widget.pressAnimationCurve,
      ),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handlePressDown() {
    if (widget.enablePressAnimation && widget.onPressed != null) {
      _pressController.forward();
    }
  }

  void _handlePressUp() {
    if (widget.enablePressAnimation && widget.onPressed != null) {
      _pressController.reverse();
    }
  }

  void _handleTap() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = GestureDetector(
      onTapDown: (TapDownDetails details) => _handlePressDown(),
      onTapUp: (TapUpDetails details) => _handlePressUp(),
      onTapCancel: () => _handlePressUp(),
      onTap: widget.onPressed != null ? _handleTap : null,
      onLongPress: widget.onLongPress,
      child: widget.child,
    );

    if (widget.enableFrostedGlass) {
      result = LiquidGlassEffects.createFrostedGlass(
        child: result,
        blurRadius: widget.blurRadius,
        opacity: widget.opacity,
        tintColor: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      );
    } else {
      result = LiquidGlassEffects.createGlassContainer(
        child: result,
        blurRadius: widget.blurRadius,
        opacity: widget.opacity,
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor,
        borderWidth: widget.borderWidth,
        borderRadius: widget.borderRadius,
        padding: widget.padding,
        margin: widget.margin,
        shadows: widget.shadows,
      );
    }

    if (widget.enableGradientOverlay) {
      result = LiquidGlassEffects.createGradientOverlay(
        child: result,
        colors: widget.gradientColors,
        begin: widget.gradientBegin,
        end: widget.gradientEnd,
        opacity: widget.gradientOpacity,
      );
    }

    if (widget.enableShimmer) {
      result = LiquidGlassEffects.createShimmerEffect(child: result);
    }

    if (widget.enableLiquidAnimation) {
      result = LiquidGlassEffects.createLiquidAnimation(
        child: result,
        duration: widget.liquidAnimationDuration,
        curve: widget.liquidAnimationCurve,
        maxScale: widget.maxScale,
      );
    }

    if (widget.enablePressAnimation) {
      result = AnimatedBuilder(
        animation: _pressAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _pressAnimation.value, child: child);
        },
        child: result,
      );
    }

    return result;
  }
}
