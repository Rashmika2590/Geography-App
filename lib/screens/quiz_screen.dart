import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_strings.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/quiz_provider.dart';
import 'package:geography_app/providers/language_provider.dart';
import 'package:geography_app/data/models/quiz_model.dart';

/// Quiz Screen - Interactive quiz interface
class QuizScreen extends StatefulWidget {
  final String provinceId;

  const QuizScreen({
    super.key,
    required this.provinceId,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Start quiz on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizProvider>().startQuiz(widget.provinceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();

    if (!quizProvider.isQuizActive) {
      return _buildQuizResults(context, quizProvider);
    }

    final currentQuiz = quizProvider.currentQuiz;
    if (currentQuiz == null) {
      return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.quizzes)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.quiz, size: 24),
            const SizedBox(width: 8),
            const Text(AppStrings.quizzes),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '${quizProvider.currentQuizIndex + 1} / ${quizProvider.totalQuestions}',
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
          // Progress Bar
          LinearProgressIndicator(
            value: (quizProvider.currentQuizIndex + 1) / quizProvider.totalQuestions,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
          ),
          
          // Quiz Content
          Expanded(
            child: _buildQuizQuestion(currentQuiz, quizProvider),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizQuestion(Quiz quiz, QuizProvider quizProvider) {
    final languageProvider = context.watch<LanguageProvider>();
    final question = languageProvider.getText(
      sinhala: quiz.questionSinhala,
      tamil: quiz.questionTamil,
      english: quiz.questionEnglish,
    );
    
    final userAnswer = quizProvider.userAnswers[quiz.id];
    final isAnswered = userAnswer != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Question Card
          Card(
            color: AppColors.accentLight.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ප්‍රශ්නය',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    question,
                    style: AppTextStyles.quizQuestion,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                        size: 16,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${quiz.points} ${AppStrings.points}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Answer Options
          ...quiz.options.map((option) {
            final isSelected = userAnswer == option;
            final isCorrect = option == quiz.correctAnswer;
            final showFeedback = isAnswered;

            Color? backgroundColor;
            Color? borderColor;
            Color? textColor;

            if (showFeedback) {
              if (isCorrect) {
                backgroundColor = AppColors.success.withOpacity(0.1);
                borderColor = AppColors.success;
                textColor = AppColors.success;
              } else if (isSelected && !isCorrect) {
                backgroundColor = AppColors.error.withOpacity(0.1);
                borderColor = AppColors.error;
                textColor = AppColors.error;
              }
            } else if (isSelected) {
              backgroundColor = AppColors.primary.withOpacity(0.1);
              borderColor = AppColors.primary;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: InkWell(
                onTap: !isAnswered
                    ? () {
                        quizProvider.submitAnswer(option);
                      }
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor ?? AppColors.textHint,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Radio/Checkbox
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: borderColor ?? AppColors.textHint,
                            width: 2,
                          ),
                          color: (showFeedback && isCorrect)
                              ? AppColors.success
                              : (isSelected
                                  ? (showFeedback && !isCorrect
                                      ? AppColors.error
                                      : AppColors.primary)
                                  : Colors.transparent),
                        ),
                        child: (showFeedback && isCorrect) || (isSelected && !showFeedback)
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      
                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Text(
                          option,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: textColor,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                      
                      if (showFeedback && isCorrect)
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.success,
                        ),
                      if (showFeedback && isSelected && !isCorrect)
                        const Icon(
                          Icons.cancel,
                          color: AppColors.error,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
          
          // Explanation (shown after answering)
          if (isAnswered) ...[
            const SizedBox(height: 16),
            Card(
              color: AppColors.info.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: AppColors.info,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'පැහැදිලි කිරීම',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.info,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      languageProvider.getText(
                        sinhala: quiz.explanationSinhala,
                        tamil: quiz.explanationTamil,
                        english: quiz.explanationEnglish,
                      ),
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Next/Finish Button
          if (isAnswered)
            ElevatedButton(
              onPressed: () {
                if (quizProvider.hasNextQuestion) {
                  quizProvider.nextQuestion();
                } else {
                  quizProvider.finishQuiz();
                  setState(() {}); // Trigger results screen
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                quizProvider.isLastQuestion ? AppStrings.finish : AppStrings.next,
                style: AppTextStyles.button,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuizResults(BuildContext context, QuizProvider quizProvider) {
    final result = quizProvider.getQuizResult();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.quizCompleted),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                result.percentage >= 60 ? Icons.emoji_events : Icons.chevron_left,
                size: 100,
                color: result.percentage >= 60 ? Colors.amber : AppColors.textSecondary,
              ),
              
              const SizedBox(height: 24),
              
              Text(
                result.grade,
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.primary,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Score Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        AppStrings.yourScore,
                        style: AppTextStyles.h3,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${result.correctAnswers} / ${result.totalQuestions}',
                        style: AppTextStyles.h1.copyWith(fontSize: 48),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${result.percentage}%',
                        style: AppTextStyles.h2.copyWith(
                          color: AppColors.accent,
                        ),
                      ),
                      const Divider(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.stars, color: Colors.amber),
                          const SizedBox(width: 8),
                          Text(
                            '${result.score} ${AppStrings.points}',
                            style: AppTextStyles.h3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Actions
              ElevatedButton(
                onPressed: () {
                  quizProvider.resetQuiz();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 16,
                  ),
                ),
                child: const Text('අවසන්'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
