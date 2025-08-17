import 'package:flutter/material.dart';
import 'dart:ui';

/// Core effects and utilities for creating iOS Liquid Glass effects
class LiquidGlassEffects {
  /// Creates a backdrop filter with blur effect
  static BackdropFilter createBackdropBlur({
    double sigmaX = 10.0,
    double sigmaY = 10.0,
    TileMode tileMode = TileMode.clamp,
  }) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigmaX,
        sigmaY: sigmaY,
        tileMode: tileMode,
      ),
    );
  }

  /// Creates a glassmorphism container with customizable properties
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
  }) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: (backgroundColor ?? Colors.white).withValues(alpha: opacity),
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(
                color: borderColor.withValues(alpha: 0.3),
                width: borderWidth,
              )
            : null,
        boxShadow:
            shadows ??
            <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 10),
              ),
            ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: child,
        ),
      ),
    );
  }

  /// Creates a gradient overlay for enhanced glass effect
  static Container createGradientOverlay({
    required Widget child,
    List<Color>? colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    double opacity = 0.1,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors:
              colors ??
              [Colors.white.withValues(alpha: opacity), Colors.transparent],
        ),
      ),
      child: child,
    );
  }

  /// Creates a shimmer effect for dynamic glass appearance
  static Widget createShimmerEffect({
    required Widget child,
    Duration duration = const Duration(seconds: 2),
    Color shimmerColor = Colors.white,
    double opacity = 0.1,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent,
                shimmerColor.withValues(alpha: opacity * value),
                Colors.transparent,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Creates a frosted glass effect with enhanced blur
  static Widget createFrostedGlass({
    required Widget child,
    double blurRadius = 15.0,
    double opacity = 0.15,
    Color? tintColor,
    double borderRadius = 16.0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
        child: Container(
          decoration: BoxDecoration(
            color: (tintColor ?? Colors.white).withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Creates a liquid animation effect
  static Widget createLiquidAnimation({
    required Widget child,
    Duration duration = const Duration(seconds: 3),
    Curve curve = Curves.easeInOut,
    double maxScale = 1.05,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        final scale = 1.0 + (maxScale - 1.0) * value;
        return Transform.scale(scale: scale, child: child);
      },
      child: child,
    );
  }
}
