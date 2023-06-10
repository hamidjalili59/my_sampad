// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_remove_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamRemoveResponseAdapter extends TypeAdapter<ExamRemoveResponse> {
  @override
  final int typeId = 16;

  @override
  ExamRemoveResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamRemoveResponse(
      exam: fields[0] as Exam,
    );
  }

  @override
  void write(BinaryWriter writer, ExamRemoveResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.exam);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamRemoveResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamRemoveResponse _$ExamRemoveResponseFromJson(Map<String, dynamic> json) =>
    ExamRemoveResponse(
      exam: Exam.fromJson(json['Exams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamRemoveResponseToJson(ExamRemoveResponse instance) =>
    <String, dynamic>{
      'Exams': instance.exam,
    };
