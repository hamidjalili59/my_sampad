// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrincipalAdapter extends TypeAdapter<Principal> {
  @override
  final int typeId = 32;

  @override
  Principal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Principal(
      schoolId: fields[0] as int,
      basicInfo: fields[1] as BasicInfoModel,
    );
  }

  @override
  void write(BinaryWriter writer, Principal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.schoolId)
      ..writeByte(1)
      ..write(obj.basicInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrincipalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Principal _$PrincipalFromJson(Map<String, dynamic> json) => Principal(
      schoolId: json['school_ID'] as int,
      basicInfo:
          BasicInfoModel.fromJson(json['basic_Info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrincipalToJson(Principal instance) => <String, dynamic>{
      'school_ID': instance.schoolId,
      'basic_Info': instance.basicInfo,
    };
