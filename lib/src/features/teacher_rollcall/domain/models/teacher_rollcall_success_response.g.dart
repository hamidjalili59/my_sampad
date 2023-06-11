// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_rollcall_success_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherRollcallSuccessResponseAdapter
    extends TypeAdapter<TeacherRollcallSuccessResponse> {
  @override
  final int typeId = 49;

  @override
  TeacherRollcallSuccessResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherRollcallSuccessResponse(
      rollcall: fields[0] as TeacherRollcall,
    );
  }

  @override
  void write(BinaryWriter writer, TeacherRollcallSuccessResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.rollcall);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherRollcallSuccessResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherRollcallSuccessResponse _$TeacherRollcallSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    TeacherRollcallSuccessResponse(
      rollcall:
          TeacherRollcall.fromJson(json['rollcall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherRollcallSuccessResponseToJson(
        TeacherRollcallSuccessResponse instance) =>
    <String, dynamic>{
      'rollcall': instance.rollcall,
    };
