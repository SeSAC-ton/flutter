import 'package:flutter/material.dart';
import 'package:sesac_ton/data/data_source/member_data_source/member_data_source_impl.dart';
import 'package:sesac_ton/presentation/home/home_screen.dart';
import 'package:sesac_ton/presentation/login/login_screen.dart';
import 'package:sesac_ton/presentation/register/register_screen.dart';

import 'data/repository/member_repository/member_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString('username');
  final password = prefs.getString('password');

  runApp(MyApp(isLoggedIn: username != null && password != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
