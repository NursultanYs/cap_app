import 'package:cap_app/features/auth/screens/sign_in_screen.dart';
import 'package:cap_app/features/home/providers/favorite_provider.dart';
import 'package:cap_app/features/home/screens/main_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: const MaterialApp(
        home: WelcomePage(),
      ),
    );
  }
}
