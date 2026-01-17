import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geography_app/firebase_options.dart';
import 'package:geography_app/core/theme/app_theme.dart';
import 'package:geography_app/core/services/storage_service.dart';
import 'package:geography_app/providers/language_provider.dart';
import 'package:geography_app/providers/geography_provider.dart';
import 'package:geography_app/providers/quiz_provider.dart';
import 'package:geography_app/providers/progress_provider.dart';
import 'package:geography_app/data/repositories/geography_repository.dart';
import 'package:geography_app/data/repositories/progress_repository.dart';
import 'package:geography_app/screens/splash_screen.dart';
import 'package:geography_app/screens/auth/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize Hive storage
  await StorageService.initialize();
  
  // Initialize sample data
  final geographyRepo = GeographyRepository();
  await geographyRepo.initializeSampleData();
  
  runApp(const GeoLankaApp());
}

class GeoLankaApp extends StatelessWidget {
  const GeoLankaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Language Provider
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        
        // Repositories
        Provider(create: (_) => GeographyRepository()),
        Provider(create: (_) => ProgressRepository()),
        
        // Geography Provider
        ChangeNotifierProxyProvider<GeographyRepository, GeographyProvider>(
          create: (context) => GeographyProvider(
            context.read<GeographyRepository>(),
          ),
          update: (context, repo, previous) => previous ?? GeographyProvider(repo),
        ),
        
        // Progress Provider
        ChangeNotifierProxyProvider<ProgressRepository, ProgressProvider>(
          create: (context) => ProgressProvider(
            context.read<ProgressRepository>(),
          ),
          update: (context, repo, previous) => previous ?? ProgressProvider(repo),
        ),
        
        // Quiz Provider (depends on both Geography and Progress)
        ChangeNotifierProxyProvider2<GeographyRepository, ProgressProvider, QuizProvider>(
          create: (context) => QuizProvider(
            context.read<GeographyRepository>(),
            context.read<ProgressProvider>(),
          ),
          update: (context, repo, progress, previous) =>
              previous ?? QuizProvider(repo, progress),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          return MaterialApp(
            title: 'GeoLanka',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            locale: Locale(languageProvider.languageCode),
            home: const AuthWrapper(),
          );
        },
      ),
    );
  }
}
