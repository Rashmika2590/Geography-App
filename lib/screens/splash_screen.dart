import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/geography_provider.dart';
import 'package:geography_app/providers/quiz_provider.dart';
import 'package:geography_app/providers/progress_provider.dart';
import 'package:geography_app/data/repositories/progress_repository.dart';
import 'package:geography_app/screens/language_selection_screen.dart';

/// Splash Screen - App entry point
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Setup animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    
    _controller.forward();
    
    // Initialize app data
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Load provinces and lessons
      // Use Microtask to avoid 'setState() during build' error if provider notifies immediately
      await Future.delayed(Duration.zero);
      if (!mounted) return;
      
      await context.read<GeographyProvider>().loadProvinces();
      await context.read<GeographyProvider>().loadLessons();
      
      // Load quizzes
      await context.read<QuizProvider>().loadQuizzes();
      
      // Initialize user progress
      await context.read<ProgressProvider>().initializeProgress(
        ProgressRepository.defaultUserId,
      );
      
      // Wait minimum time for splash animation
      await Future.delayed(const Duration(seconds: 2));
      
      // Navigate to language selection
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LanguageSelectionScreen(),
          ),
        );
      }
    } catch (e) {
      // Handle errors - show error dialog
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('දෝෂයක්'),
            content: Text('යෙදුම පූරණය කිරීමේදී දෝෂයක්: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _initialize(); // Retry
                },
                child: const Text('නැවත උත්සාහ කරන්න'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon/Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.map,
                  size: 64,
                  color: AppColors.primary,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // App Name
              Text(
                'GeoLanka',
                style: AppTextStyles.h1.copyWith(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Tagline
              Text(
                'භූගෝලය ඉගෙන ගන්න සිතියමෙන්',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Loading indicator
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
