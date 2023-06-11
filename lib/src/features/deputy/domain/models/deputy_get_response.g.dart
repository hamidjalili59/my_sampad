// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deputy_get_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeputyGetResponseAdapter extends TypeAdapter<DeputyGetResponse> {
  @override
  final int typeId = 17;

  @override
  DeputyGetResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeputyGetResponse(
      deputys: fields[0] == null ? [] : (fields[0] as List).cast<Deputy>(),
    );
  }

  @override
  void write(BinaryWriter writer, DeputyGetResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deputys);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeputyGetResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeputyGetResponse _$DeputyGetResponseFromJson(Map<String, dynamic> json) =>
    DeputyGetResponse(
      deputys: (json['Deputys'] as List<dynamic>?)
              ?.map((e) => Deputy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DeputyGetResponseToJson(DeputyGetResponse instance) =>
    <String, dynamic>{
      'Deputys': instance.deputys,
    };
