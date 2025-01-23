import 'package:cap_app/features/home/data_provider.dart';
import 'package:cap_app/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CarApp());
}

class CarApp extends StatelessWidget {
  const CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: const MaterialApp(
        home: WelcomePage(),
      ),
    );
  }
}
