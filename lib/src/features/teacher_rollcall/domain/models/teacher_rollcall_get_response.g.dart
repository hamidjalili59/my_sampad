// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_rollcall_get_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherRollcallGetResponseAdapter
    extends TypeAdapter<TeacherRollcallGetResponse> {
  @override
  final int typeId = 47;

  @override
  TeacherRollcallGetResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherRollcallGetResponse(
      rollcalls:
          fields[0] == null ? [] : (fields[0] as List).cast<TeacherRollcall>(),
    );
  }

  @override
  void write(BinaryWriter writer, TeacherRollcallGetResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.rollcalls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherRollcallGetResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherRollcallGetResponse _$TeacherRollcallGetResponseFromJson(
        Map<String, dynamic> json) =>
    TeacherRollcallGetResponse(
      rollcalls: (json['rollcalls'] as List<dynamic>)
          .map((e) => TeacherRollcall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherRollcallGetResponseToJson(
        TeacherRollcallGetResponse instance) =>
    <String, dynamic>{
      'rollcalls': instance.rollcalls,
    };
