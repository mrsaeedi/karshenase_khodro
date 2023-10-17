// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'automative_expert_cheklist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAdapter extends TypeAdapter<Car> {
  @override
  final int typeId = 0;

  @override
  Car read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Car(
      expert: (fields[4] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<dynamic>())),
      name: fields[1] as String,
      fullDescription: fields[3] as String,
      other: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Car obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.other)
      ..writeByte(3)
      ..write(obj.fullDescription)
      ..writeByte(4)
      ..write(obj.expert);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AutomativeExpertModelAdapter extends TypeAdapter<AutomativeExpertModel> {
  @override
  final int typeId = 1;

  @override
  AutomativeExpertModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AutomativeExpertModel(
      title: fields[1] as String,
      isHealthy: fields[2] as bool?,
      description: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AutomativeExpertModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isHealthy)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutomativeExpertModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
