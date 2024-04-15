import 'package:desafio_flutter_hero/controller/dependency_controller.dart';
import 'package:desafio_flutter_hero/screens/initialscreen.dart';
import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  DependencyController.startDependecy();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: CustomColorTheme.customRed),
        useMaterial3: true,
      ),
      home: const InitialScreen(),
    );
  }
}

