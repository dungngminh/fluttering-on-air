// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogAdapter extends TypeAdapter<Dog> {
  @override
  final int typeId = 0;

  @override
  Dog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dog(
      bredFor: fields[2] as String?,
      breedGroup: fields[3] as String?,
      height: fields[4] as Height?,
      id: fields[0] as int?,
      lifeSpan: fields[5] as String?,
      name: fields[1] as String?,
      origin: fields[6] as String?,
      temperament: fields[7] as String?,
      weight: fields[8] as Weight?,
      url: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Dog obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.bredFor)
      ..writeByte(3)
      ..write(obj.breedGroup)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.lifeSpan)
      ..writeByte(6)
      ..write(obj.origin)
      ..writeByte(7)
      ..write(obj.temperament)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
