import 'package:geography_app/data/models/user_progress_model.dart';
import 'package:geography_app/core/services/storage_service.dart';

/// Repository for User Progress data
class ProgressRepository {
  static const String defaultUserId = 'default_user';

  /// Get user progress
  Future<UserProgress?> getUserProgress(String userId) async {
    final progressBox = StorageService.getUserProgressBox();
    return progressBox.get(userId);
  }

  /// Save user progress
  Future<void> saveUserProgress(UserProgress progress) async {
    final progressBox = StorageService.getUserProgressBox();
    await progressBox.put(progress.userId, progress);
  }

  /// Delete user progress
  Future<void> deleteUserProgress(String userId) async {
    final progressBox = StorageService.getUserProgressBox();
    await progressBox.delete(userId);
  }

  /// Check if user progress exists
  Future<bool> hasUserProgress(String userId) async {
    final progressBox = StorageService.getUserProgressBox();
    return progressBox.containsKey(userId);
  }
}
