import 'package:flutter/material.dart';
import 'package:flutter_ios_liquidglass/flutter_ios_liquidglass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Glass Demo',
      theme: ThemeData.dark(),
      home: const LiquidGlassDemo(),
    );
  }
}

class LiquidGlassDemo extends StatefulWidget {
  const LiquidGlassDemo({super.key});

  @override
  State<LiquidGlassDemo> createState() => _LiquidGlassDemoState();
}

class _LiquidGlassDemoState extends State<LiquidGlassDemo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Liquid Glass App Bar
              SliverAppBar(
                expandedHeight: 120,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Liquid Glass',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: LiquidGlassContainer(
                    blurRadius: 20.0,
                    opacity: 0.1,
                    enableGradientOverlay: true,
                    gradientColors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                    child: Container(),
                  ),
                ),
              ),

              // Content
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Welcome Card
                    LiquidGlassCard(
                      enableFrostedGlass: true,
                      enableShimmer: true,
                      enableLiquidAnimation: true,
                      borderRadius: 24.0,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: 0.8 + (_animation.value * 0.4),
                                  child: const Icon(
                                    Icons.auto_awesome,
                                    size: 48,
                                    color: Colors.amber,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Welcome to the Future of UI Design!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Experience the magic of iOS Liquid Glass effects with beautiful glassmorphism components.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Features Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildFeatureCard(
                          icon: Icons.blur_on,
                          title: 'Glass Effects',
                          description: 'Beautiful backdrop blur',
                          color: Colors.blue,
                        ),
                        _buildFeatureCard(
                          icon: Icons.animation,
                          title: 'Animations',
                          description: 'Smooth liquid effects',
                          color: Colors.purple,
                        ),
                        _buildFeatureCard(
                          icon: Icons.palette,
                          title: 'Customizable',
                          description: 'Endless possibilities',
                          color: Colors.green,
                        ),
                        _buildFeatureCard(
                          icon: Icons.phone_iphone,
                          title: 'iOS Native',
                          description: 'Authentic feel',
                          color: Colors.orange,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Interactive Buttons
                    LiquidGlassContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Interactive Elements',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: LiquidGlassButton(
                                    onPressed: () => _showBottomSheet(context),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      child: Text(
                                        'Bottom Sheet',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    enablePressAnimation: true,
                                    enableShimmer: true,
                                    borderRadius: 12.0,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: LiquidGlassButton(
                                    onPressed: () => _showDialog(context),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 12,
                                      ),
                                      child: Text(
                                        'Dialog',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    enablePressAnimation: true,
                                    enableShimmer: true,
                                    borderRadius: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      blurRadius: 15.0,
                      opacity: 0.2,
                      borderRadius: 20.0,
                    ),

                    const SizedBox(height: 24),

                    // Custom Effects Demo
                    LiquidGlassContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Custom Effects',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            LiquidGlassEffects.createFrostedGlass(
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Frosted Glass Effect',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              blurRadius: 25.0,
                              opacity: 0.3,
                              borderRadius: 16.0,
                            ),
                            const SizedBox(height: 16),
                            LiquidGlassEffects.createShimmerEffect(
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Shimmer Effect',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          ],
                        ),
                      ),
                      blurRadius: 20.0,
                      opacity: 0.25,
                      borderRadius: 20.0,
                      enableGradientOverlay: true,
                      gradientColors: [
                        Colors.purple.withValues(alpha: 0.1),
                        Colors.blue.withValues(alpha: 0.1),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return LiquidGlassCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      enableFrostedGlass: true,
      borderRadius: 16.0,
      enableLiquidAnimation: true,
    );
  }

  void _showBottomSheet(BuildContext context) {
    context.showLiquidGlassBottomSheet(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Liquid Glass Bottom Sheet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This is a beautiful bottom sheet with glassmorphism effects. You can customize it with various options like blur radius, opacity, and animations.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            LiquidGlassButton(
              onPressed: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Text('Close', style: TextStyle(color: Colors.white)),
              ),
              enablePressAnimation: true,
              borderRadius: 12.0,
            ),
          ],
        ),
      ),
      enableFrostedGlass: true,
      enableDragHandle: true,
      borderRadius: 24.0,
      blurRadius: 25.0,
      opacity: 0.35,
    );
  }

  void _showDialog(BuildContext context) {
    context.showLiquidGlassDialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.auto_awesome, size: 48, color: Colors.amber),
            const SizedBox(height: 16),
            const Text(
              'Liquid Glass Dialog',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Experience the magic of glassmorphism in dialogs!',
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LiquidGlassButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  enablePressAnimation: true,
                  borderRadius: 12.0,
                  opacity: 0.3,
                ),
                LiquidGlassButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('OK', style: TextStyle(color: Colors.white)),
                  ),
                  enablePressAnimation: true,
                  borderRadius: 12.0,
                ),
              ],
            ),
          ],
        ),
      ),
      enableBackdropBlur: true,
      enableFrostedGlass: true,
      blurRadius: 30.0,
      opacity: 0.4,
      borderRadius: 28.0,
    );
  }
}
