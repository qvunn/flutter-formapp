import 'package:flutter/material.dart';
import 'package:route_flutter/screens/home_screen.dart';
import 'package:route_flutter/screens/login_screen.dart';
import 'package:route_flutter/screens/profile_screen.dart';
import 'package:route_flutter/screens/splash_screen.dart';
import 'package:route_flutter/screens/register_screen.dart';
import 'package:route_flutter/screens/forgot_password_screen.dart';
import 'package:route_flutter/screens/profile_edit_screen.dart';
import 'package:route_flutter/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/prodile-edit': (context) => const ProfileEditScreen(),
        '/setting':(context) => const SettingsScreen(),
      },
    );
  }
}
