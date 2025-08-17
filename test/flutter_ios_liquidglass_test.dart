import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_liquidglass/flutter_ios_liquidglass.dart';

void main() {
  group('LiquidGlassEffects Tests', () {
    testWidgets('createBackdropBlur creates BackdropFilter', (WidgetTester tester) async {
      final backdropFilter = LiquidGlassEffects.createBackdropBlur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Container(color: Colors.blue),
              backdropFilter,
            ],
          ),
        ),
      ));

      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('createGlassContainer creates Container with BackdropFilter', (WidgetTester tester) async {
      final glassContainer = LiquidGlassEffects.createGlassContainer(
        child: Text('Test'),
        blurRadius: 10.0,
        opacity: 0.2,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: glassContainer),
      ));

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('createFrostedGlass creates ClipRRect with BackdropFilter', (WidgetTester tester) async {
      final frostedGlass = LiquidGlassEffects.createFrostedGlass(
        child: Text('Test'),
        blurRadius: 15.0,
        opacity: 0.15,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: frostedGlass),
      ));

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });
  });

  group('LiquidGlassContainer Tests', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      final container = LiquidGlassContainer(
        child: Text('Test Container'),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: container),
      ));

      expect(find.text('Test Container'), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('renders with custom properties', (WidgetTester tester) async {
      final container = LiquidGlassContainer(
        child: Text('Custom Container'),
        blurRadius: 20.0,
        opacity: 0.3,
        backgroundColor: Colors.blue,
        borderRadius: 16.0,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: container),
      ));

      expect(find.text('Custom Container'), findsOneWidget);
    });
  });

  group('LiquidGlassCard Tests', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      final card = LiquidGlassCard(
        child: Text('Test Card'),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: card),
      ));

      expect(find.text('Test Card'), findsOneWidget);
    });

    testWidgets('renders with frosted glass effect', (WidgetTester tester) async {
      final card = LiquidGlassCard(
        child: Text('Frosted Card'),
        enableFrostedGlass: true,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: card),
      ));

      expect(find.text('Frosted Card'), findsOneWidget);
    });
  });

  group('LiquidGlassButton Tests', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      final button = LiquidGlassButton(
        onPressed: () {},
        child: Text('Test Button'),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: button),
      ));

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('handles onPressed callback', (WidgetTester tester) async {
      bool pressed = false;
      final button = LiquidGlassButton(
        onPressed: () => pressed = true,
        child: Text('Press Me'),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: button),
      ));

      await tester.tap(find.text('Press Me'));
      expect(pressed, isTrue);
    });
  });

  group('LiquidGlassAppBar Tests', () {
    testWidgets('renders with title', (WidgetTester tester) async {
      final appBar = LiquidGlassAppBar(
        title: Text('Test App Bar'),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(appBar: appBar),
      ));

      expect(find.text('Test App Bar'), findsOneWidget);
    });
  });

  group('LiquidGlassTheme Tests', () {
    test('creates theme with default values', () {
      final theme = LiquidGlassTheme();
      
      expect(theme.blurRadius, equals(10.0));
      expect(theme.opacity, equals(0.2));
      expect(theme.borderRadius, equals(12.0));
    });

    test('creates theme with custom values', () {
      final theme = LiquidGlassTheme(
        blurRadius: 20.0,
        opacity: 0.3,
        backgroundColor: Colors.blue,
      );
      
      expect(theme.blurRadius, equals(20.0));
      expect(theme.opacity, equals(0.3));
      expect(theme.backgroundColor, equals(Colors.blue));
    });

    test('copyWith creates new theme with updated values', () {
      final originalTheme = LiquidGlassTheme();
      final updatedTheme = originalTheme.copyWith(
        blurRadius: 25.0,
        opacity: 0.4,
      );
      
      expect(updatedTheme.blurRadius, equals(25.0));
      expect(updatedTheme.opacity, equals(0.4));
      expect(updatedTheme.borderRadius, equals(12.0)); // unchanged
    });

    test('darkTheme creates dark variant', () {
      final theme = LiquidGlassTheme();
      final darkTheme = theme.darkTheme;
      
      expect(darkTheme.backgroundColor, equals(Colors.black));
      expect(darkTheme.borderColor, equals(Colors.white));
    });

    test('lightTheme creates light variant', () {
      final theme = LiquidGlassTheme();
      final lightTheme = theme.lightTheme;
      
      expect(lightTheme.backgroundColor, equals(Colors.white));
      expect(lightTheme.borderColor, equals(Colors.black));
    });

    test('colored creates colored variant', () {
      final theme = LiquidGlassTheme();
      final coloredTheme = theme.colored(Colors.red);
      
      expect(coloredTheme.backgroundColor, equals(Colors.red));
      expect(coloredTheme.borderColor, equals(Colors.red));
    });
  });
}
