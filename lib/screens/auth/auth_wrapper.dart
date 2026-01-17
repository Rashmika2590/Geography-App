import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geography_app/data/services/auth_service.dart';
import 'package:geography_app/screens/home_screen.dart';
import 'package:geography_app/screens/auth/login_screen.dart';
import 'package:geography_app/screens/splash_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // If the snapshot has user data, the user is signed in
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          
          if (user == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
          }
        }

        // Otherwise, show loading or splash
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
