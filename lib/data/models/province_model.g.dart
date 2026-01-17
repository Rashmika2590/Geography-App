// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProvinceAdapter extends TypeAdapter<Province> {
  @override
  final int typeId = 0;

  @override
  Province read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Province(
      id: fields[0] as String,
      nameSinhala: fields[1] as String,
      nameTamil: fields[2] as String,
      nameEnglish: fields[3] as String,
      climate: fields[4] as String,
      rainfallPattern: fields[5] as String,
      rivers: (fields[6] as List).cast<String>(),
      agriculture: (fields[7] as List).cast<String>(),
      population: fields[8] as int,
      naturalDisasters: (fields[9] as List).cast<String>(),
      touristAttractions: (fields[10] as List).cast<String>(),
      svgPath: fields[11] as String,
      centerLatitude: fields[12] as double,
      centerLongitude: fields[13] as double,
      imagePath: fields[14] as String,
      description: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Province obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameSinhala)
      ..writeByte(2)
      ..write(obj.nameTamil)
      ..writeByte(3)
      ..write(obj.nameEnglish)
      ..writeByte(4)
      ..write(obj.climate)
      ..writeByte(5)
      ..write(obj.rainfallPattern)
      ..writeByte(6)
      ..write(obj.rivers)
      ..writeByte(7)
      ..write(obj.agriculture)
      ..writeByte(8)
      ..write(obj.population)
      ..writeByte(9)
      ..write(obj.naturalDisasters)
      ..writeByte(10)
      ..write(obj.touristAttractions)
      ..writeByte(11)
      ..write(obj.svgPath)
      ..writeByte(12)
      ..write(obj.centerLatitude)
      ..writeByte(13)
      ..write(obj.centerLongitude)
      ..writeByte(14)
      ..write(obj.imagePath)
      ..writeByte(15)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvinceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
