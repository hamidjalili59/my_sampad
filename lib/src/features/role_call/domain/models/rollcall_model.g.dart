// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rollcall_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RollcallAdapter extends TypeAdapter<Rollcall> {
  @override
  final int typeId = 29;

  @override
  Rollcall read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rollcall();
  }

  @override
  void write(BinaryWriter writer, Rollcall obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RollcallAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rollcall _$$_RollcallFromJson(Map<String, dynamic> json) => _$_Rollcall(
      rolecallId: json['rollCall_ID'] as int? ?? 0,
      studentId: json['student_ID'] as int? ?? 0,
      classId: json['class_ID'] as int? ?? 0,
      classTime: json['class_Time'] as int? ?? 0,
      absent: json['absent'] as bool? ?? false,
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$$_RollcallToJson(_$_Rollcall instance) =>
    <String, dynamic>{
      'rollCall_ID': instance.rolecallId,
      'student_ID': instance.studentId,
      'class_ID': instance.classId,
      'class_Time': instance.classTime,
      'absent': instance.absent,
      'date': instance.date,
    };
