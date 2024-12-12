// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedSessionAdapter extends TypeAdapter<SavedSession> {
  @override
  final int typeId = 1;

  @override
  SavedSession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedSession(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
      expiresIn: fields[2] as int,
      expiresAt: fields[3] as int,
      refreshToken: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedSession obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(3)
      ..write(obj.expiresAt)
      ..writeByte(4)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedSessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
