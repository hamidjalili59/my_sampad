// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_rollcall_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherRollcallAdapter extends TypeAdapter<TeacherRollcall> {
  @override
  final int typeId = 48;

  @override
  TeacherRollcall read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherRollcall();
  }

  @override
  void write(BinaryWriter writer, TeacherRollcall obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherRollcallAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeacherRollcall _$$_TeacherRollcallFromJson(Map<String, dynamic> json) =>
    _$_TeacherRollcall(
      rolecallId: json['rollCall_ID'] as int? ?? 0,
      schoolId: json['school_ID'] as int? ?? 0,
      phoneNumber: (json['phoneNumber'] as num?)?.toDouble() ?? 0.0,
      absent: json['absent'] as bool? ?? false,
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$$_TeacherRollcallToJson(_$_TeacherRollcall instance) =>
    <String, dynamic>{
      'rollCall_ID': instance.rolecallId,
      'school_ID': instance.schoolId,
      'phoneNumber': instance.phoneNumber,
      'absent': instance.absent,
      'date': instance.date,
    };
