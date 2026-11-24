import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SaborApp());
}

class SaborApp extends StatelessWidget {
  const SaborApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaborApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
