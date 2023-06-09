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
      teacher: fields[2] as Teacher,
      parent: fields[3] as Parent,
      principal: fields[4] as Principal,
      code: fields[5] as int,
      phoneNumber: fields[6] == null ? 0 : fields[6] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, OtpHandshakeResponse obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.code)
      ..writeByte(6)
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
      teacher: Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      parent: Parent.fromJson(json['parent'] as Map<String, dynamic>),
      principal: Principal.fromJson(json['principal'] as Map<String, dynamic>),
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
      'code': instance.code,
      'phoneNumber': instance.phoneNumber,
    };
