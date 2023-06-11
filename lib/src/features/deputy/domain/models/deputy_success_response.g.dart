// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deputy_success_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeputySuccessResponseAdapter extends TypeAdapter<DeputySuccessResponse> {
  @override
  final int typeId = 15;

  @override
  DeputySuccessResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeputySuccessResponse(
      deputy: fields[0] as Deputy,
    );
  }

  @override
  void write(BinaryWriter writer, DeputySuccessResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deputy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeputySuccessResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeputySuccessResponse _$DeputySuccessResponseFromJson(
        Map<String, dynamic> json) =>
    DeputySuccessResponse(
      deputy: Deputy.fromJson(json['Deputy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeputySuccessResponseToJson(
        DeputySuccessResponse instance) =>
    <String, dynamic>{
      'Deputy': instance.deputy,
    };
