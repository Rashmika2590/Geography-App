import 'package:flutter/material.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/data/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: authService.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading profile: ${snapshot.error}'));
          }

          final userData = snapshot.data;
          final user = authService.currentUser;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                // Avatar Placeholder
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primaryLight.withOpacity(0.2),
                  child: Text(
                    userData?['name']?.substring(0, 1).toUpperCase() ?? user?.email?[0].toUpperCase() ?? '?',
                    style: const TextStyle(fontSize: 40, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Name
                Text(
                  userData?['name'] ?? 'User',
                  style: AppTextStyles.h2,
                ),
                const SizedBox(height: 8),
                
                // Email
                Text(
                  user?.email ?? '',
                  style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textSecondary),
                ),
                
                const SizedBox(height: 8),
                if (userData != null && userData['grade'] != null)
                   Chip(
                     label: Text('Grade ${userData['grade']}'),
                     backgroundColor: AppColors.primaryLight.withOpacity(0.1),
                   ),

                const SizedBox(height: 48),

                // Stats Card (Placeholder for now)
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem('Points', '${userData?['totalPoints'] ?? 0}'),
                        _buildStatItem('Lessons', '${(userData?['completedLessons'] as List?)?.length ?? 0}'),
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                // Sign Out Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await authService.signOut();
                      if (context.mounted) {
                        Navigator.of(context).pop(); // Close profile screen to reveal LoginScreen (via AuthWrapper)
                      }
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Sign Out'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.h2.copyWith(color: AppColors.primary),
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}
