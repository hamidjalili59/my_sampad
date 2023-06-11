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
      deputyId: json['deputyId'] as int? ?? 0,
      schoolId: json['schoolId'] as int? ?? 0,
      basicInfo: json['basicInfo'] == null
          ? null
          : BasicInfoModel.fromJson(json['basicInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeputyToJson(_$_Deputy instance) => <String, dynamic>{
      'deputyId': instance.deputyId,
      'schoolId': instance.schoolId,
      'basicInfo': instance.basicInfo,
    };
