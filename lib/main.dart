import 'package:flutter/material.dart';
import 'package:mini_shop/widgets/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniShop',
      home: const Home(),
    );
  }
}