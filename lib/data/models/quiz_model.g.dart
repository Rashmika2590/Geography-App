// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizAdapter extends TypeAdapter<Quiz> {
  @override
  final int typeId = 3;

  @override
  Quiz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quiz(
      id: fields[0] as String,
      questionSinhala: fields[1] as String,
      questionTamil: fields[2] as String,
      questionEnglish: fields[3] as String,
      type: fields[4] as QuizType,
      options: (fields[5] as List).cast<String>(),
      correctAnswer: fields[6] as String,
      explanationSinhala: fields[7] as String,
      explanationTamil: fields[8] as String,
      explanationEnglish: fields[9] as String,
      points: fields[10] as int,
      provinceId: fields[11] as String?,
      difficultyLevel: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Quiz obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.questionSinhala)
      ..writeByte(2)
      ..write(obj.questionTamil)
      ..writeByte(3)
      ..write(obj.questionEnglish)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.options)
      ..writeByte(6)
      ..write(obj.correctAnswer)
      ..writeByte(7)
      ..write(obj.explanationSinhala)
      ..writeByte(8)
      ..write(obj.explanationTamil)
      ..writeByte(9)
      ..write(obj.explanationEnglish)
      ..writeByte(10)
      ..write(obj.points)
      ..writeByte(11)
      ..write(obj.provinceId)
      ..writeByte(12)
      ..write(obj.difficultyLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuizTypeAdapter extends TypeAdapter<QuizType> {
  @override
  final int typeId = 4;

  @override
  QuizType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuizType.multipleChoice;
      case 1:
        return QuizType.mapPin;
      case 2:
        return QuizType.matchRiver;
      case 3:
        return QuizType.trueOrFalse;
      default:
        return QuizType.multipleChoice;
    }
  }

  @override
  void write(BinaryWriter writer, QuizType obj) {
    switch (obj) {
      case QuizType.multipleChoice:
        writer.writeByte(0);
        break;
      case QuizType.mapPin:
        writer.writeByte(1);
        break;
      case QuizType.matchRiver:
        writer.writeByte(2);
        break;
      case QuizType.trueOrFalse:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
