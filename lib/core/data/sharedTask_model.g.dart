// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sharedTask_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SharedtaskModelAdapter extends TypeAdapter<SharedtaskModel> {
  @override
  final int typeId = 1;

  @override
  SharedtaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SharedtaskModel(
      color: fields[0] as int,
      title: fields[1] as String,
      date: fields[2] as String,
      description: fields[3] as String,
      time: fields[4] as String,
      status: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SharedtaskModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SharedtaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
