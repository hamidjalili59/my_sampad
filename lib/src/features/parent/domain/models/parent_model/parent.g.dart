// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParentAdapter extends TypeAdapter<Parent> {
  @override
  final int typeId = 27;

  @override
  Parent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Parent();
  }

  @override
  void write(BinaryWriter writer, Parent obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Parent _$$_ParentFromJson(Map<String, dynamic> json) => _$_Parent(
      parentId: json['parentId'] as int?,
      schoolId: json['schoolId'] as int?,
      basicInfo: json['basicInfo'] == null
          ? null
          : BasicInfoModel.fromJson(json['basicInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ParentToJson(_$_Parent instance) => <String, dynamic>{
      'parentId': instance.parentId,
      'schoolId': instance.schoolId,
      'basicInfo': instance.basicInfo,
    };
