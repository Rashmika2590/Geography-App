import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/data/models/lesson_model.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_strings.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/progress_provider.dart';
import 'package:geography_app/providers/language_provider.dart';

/// Lesson Viewer Screen - Displays lessons with navigation
class LessonViewerScreen extends StatefulWidget {
  final List<Lesson> lessons;
  final int initialIndex;

  const LessonViewerScreen({
    super.key,
    required this.lessons,
    this.initialIndex = 0,
  });

  @override
  State<LessonViewerScreen> createState() => _LessonViewerScreenState();
}

class _LessonViewerScreenState extends State<LessonViewerScreen> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentLesson = widget.lessons[_currentIndex];
    final progressProvider = context.watch<ProgressProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final isCompleted = progressProvider.isLessonCompleted(currentLesson.id);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.book, size: 24),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                AppStrings.lessons,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${widget.lessons.length}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Indicator
          LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.lessons.length,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
          
          // Lesson Content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.lessons.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final lesson = widget.lessons[index];
                return _buildLessonContent(lesson, languageProvider);
              },
            ),
          ),
          
          // Bottom Actions
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Mark Complete Button
                if (!isCompleted)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        progressProvider.completeLesson(currentLesson.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppStrings.lessonCompleted),
                            backgroundColor: AppColors.success,
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle),
                      label: Text(AppStrings.markComplete),
                    ),
                  )
                else
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.completed,
                            style: AppTextStyles.button.copyWith(
                              color: AppColors.success,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                if (_currentIndex < widget.lessons.length - 1) ...[
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                    ),
                    child: Row(
                      children: [
                        Text(AppStrings.next),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward, size: 18),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonContent(Lesson lesson, LanguageProvider languageProvider) {
    final title = languageProvider.getText(
      sinhala: lesson.titleSinhala,
      tamil: lesson.titleTamil,
      english: lesson.titleEnglish,
    );
    
    final content = languageProvider.getText(
      sinhala: lesson.contentSinhala,
      tamil: lesson.contentTamil,
      english: lesson.contentEnglish,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getCategoryColor(lesson.category).withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              _getCategoryName(lesson.category),
              style: AppTextStyles.bodySmall.copyWith(
                color: _getCategoryColor(lesson.category),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Lesson Title
          Text(
            title,
            style: AppTextStyles.h2,
          ),
          
          const SizedBox(height: 8),
          
          // Grade Level
          Row(
            children: [
              Icon(
                Icons.school,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                'ශ්‍රේණිය ${lesson.gradeLevel}',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
          
          const Divider(height: 32),
          
          // Lesson Content
          Text(
            content,
            style: AppTextStyles.bodyLarge,
          ),
          
          const SizedBox(height: 24),
          
          // Key Points
          if (lesson.keyPoints.isNotEmpty) ...[
            Text(
              'ප්‍රධාන කරුණු:',
              style: AppTextStyles.h3,
            ),
            const SizedBox(height: 12),
            ...lesson.keyPoints.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          point,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }

  Color _getCategoryColor(LessonCategory category) {
    switch (category) {
      case LessonCategory.physicalGeography:
        return AppColors.physicalGeo;
      case LessonCategory.humanGeography:
        return AppColors.humanGeo;
      case LessonCategory.environmentalGeography:
        return AppColors.environmentalGeo;
    }
  }

  String _getCategoryName(LessonCategory category) {
    switch (category) {
      case LessonCategory.physicalGeography:
        return AppStrings.physicalGeography;
      case LessonCategory.humanGeography:
        return AppStrings.humanGeography;
      case LessonCategory.environmentalGeography:
        return AppStrings.environmentalGeography;
    }
  }
}
