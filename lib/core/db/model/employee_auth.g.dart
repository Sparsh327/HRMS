// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_auth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeAuthModelAdapter extends TypeAdapter<EmployeeAuthModel> {
  @override
  final int typeId = 0;

  @override
  EmployeeAuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeAuthModel(
      employeeId: fields[0] as String,
      companyId: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeAuthModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.employeeId)
      ..writeByte(1)
      ..write(obj.companyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
