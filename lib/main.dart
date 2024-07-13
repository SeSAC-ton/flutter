import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('새싹톤', style: TextStyles.a.copyWith()),
        ),
      ),
    );
  }
}

abstract class TextStyles {
  static const TextStyle a = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
}