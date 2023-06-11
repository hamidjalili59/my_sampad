// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deputy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeputyAdapter extends TypeAdapter<Deputy> {
  @override
  final int typeId = 19;

  @override
  Deputy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Deputy();
  }

  @override
  void write(BinaryWriter writer, Deputy obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeputyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deputy _$$_DeputyFromJson(Map<String, dynamic> json) => _$_Deputy(
      deputyId: json['deputy_ID'] as int? ?? 0,
      schoolId: json['school_ID'] as int? ?? 0,
      basicInfo: json['basic_Info'] == null
          ? null
          : BasicInfoModel.fromJson(json['basic_Info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeputyToJson(_$_Deputy instance) => <String, dynamic>{
      'deputy_ID': instance.deputyId,
      'school_ID': instance.schoolId,
      'basic_Info': instance.basicInfo,
    };
