// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonAdapter extends TypeAdapter<Lesson> {
  @override
  final int typeId = 1;

  @override
  Lesson read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lesson(
      id: fields[0] as String,
      titleSinhala: fields[1] as String,
      titleTamil: fields[2] as String,
      titleEnglish: fields[3] as String,
      contentSinhala: fields[4] as String,
      contentTamil: fields[5] as String,
      contentEnglish: fields[6] as String,
      imagePaths: (fields[7] as List).cast<String>(),
      category: fields[8] as LessonCategory,
      gradeLevel: fields[9] as int,
      order: fields[10] as int,
      provinceId: fields[11] as String?,
      keyPoints: (fields[12] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Lesson obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titleSinhala)
      ..writeByte(2)
      ..write(obj.titleTamil)
      ..writeByte(3)
      ..write(obj.titleEnglish)
      ..writeByte(4)
      ..write(obj.contentSinhala)
      ..writeByte(5)
      ..write(obj.contentTamil)
      ..writeByte(6)
      ..write(obj.contentEnglish)
      ..writeByte(7)
      ..write(obj.imagePaths)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.gradeLevel)
      ..writeByte(10)
      ..write(obj.order)
      ..writeByte(11)
      ..write(obj.provinceId)
      ..writeByte(12)
      ..write(obj.keyPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LessonCategoryAdapter extends TypeAdapter<LessonCategory> {
  @override
  final int typeId = 2;

  @override
  LessonCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LessonCategory.physicalGeography;
      case 1:
        return LessonCategory.humanGeography;
      case 2:
        return LessonCategory.environmentalGeography;
      default:
        return LessonCategory.physicalGeography;
    }
  }

  @override
  void write(BinaryWriter writer, LessonCategory obj) {
    switch (obj) {
      case LessonCategory.physicalGeography:
        writer.writeByte(0);
        break;
      case LessonCategory.humanGeography:
        writer.writeByte(1);
        break;
      case LessonCategory.environmentalGeography:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
