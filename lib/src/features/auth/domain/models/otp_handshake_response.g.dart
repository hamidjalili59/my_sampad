// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_handshake_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OtpHandshakeResponseAdapter extends TypeAdapter<OtpHandshakeResponse> {
  @override
  final int typeId = 0;

  @override
  OtpHandshakeResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OtpHandshakeResponse(
      token: fields[0] as String,
      typeOfUser: fields[1] as String,
      teacher: fields[2] as Teacher?,
      parent: fields[3] as Parent?,
      principal: fields[4] as Principal?,
      deputy: fields[5] as Deputy?,
      code: fields[6] as int,
      phoneNumber: fields[7] == null ? 0 : fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, OtpHandshakeResponse obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.typeOfUser)
      ..writeByte(2)
      ..write(obj.teacher)
      ..writeByte(3)
      ..write(obj.parent)
      ..writeByte(4)
      ..write(obj.principal)
      ..writeByte(5)
      ..write(obj.deputy)
      ..writeByte(6)
      ..write(obj.code)
      ..writeByte(7)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OtpHandshakeResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpHandshakeResponse _$OtpHandshakeResponseFromJson(
        Map<String, dynamic> json) =>
    OtpHandshakeResponse(
      token: json['token'] as String,
      typeOfUser: json['typeOfUser'] as String,
      teacher: json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      parent: json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
      principal: json['principal'] == null
          ? null
          : Principal.fromJson(json['principal'] as Map<String, dynamic>),
      deputy: json['deputy'] == null
          ? null
          : Deputy.fromJson(json['deputy'] as Map<String, dynamic>),
      code: json['code'] as int,
      phoneNumber: (json['phoneNumber'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$OtpHandshakeResponseToJson(
        OtpHandshakeResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'typeOfUser': instance.typeOfUser,
      'teacher': instance.teacher,
      'parent': instance.parent,
      'principal': instance.principal,
      'deputy': instance.deputy,
      'code': instance.code,
      'phoneNumber': instance.phoneNumber,
    };
