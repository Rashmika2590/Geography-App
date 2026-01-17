// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProgressAdapter extends TypeAdapter<UserProgress> {
  @override
  final int typeId = 5;

  @override
  UserProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProgress(
      userId: fields[0] as String,
      completedLessons: (fields[1] as Map?)?.cast<String, bool>(),
      quizScores: (fields[2] as Map?)?.cast<String, int>(),
      totalPoints: fields[3] as int,
      currentLevel: fields[4] as int,
      lastActiveDate: fields[5] as DateTime?,
      provinceProgress: (fields[6] as Map?)?.cast<String, double>(),
      totalQuizzesTaken: fields[7] as int,
      totalLessonsCompleted: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserProgress obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.completedLessons)
      ..writeByte(2)
      ..write(obj.quizScores)
      ..writeByte(3)
      ..write(obj.totalPoints)
      ..writeByte(4)
      ..write(obj.currentLevel)
      ..writeByte(5)
      ..write(obj.lastActiveDate)
      ..writeByte(6)
      ..write(obj.provinceProgress)
      ..writeByte(7)
      ..write(obj.totalQuizzesTaken)
      ..writeByte(8)
      ..write(obj.totalLessonsCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
