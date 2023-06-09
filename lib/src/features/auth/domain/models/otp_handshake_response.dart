import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';

part 'otp_handshake_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class OtpHandshakeResponse {
  @HiveField(0)
  @JsonKey(name: 'token')
  final String token;
  @HiveField(1)
  @JsonKey(name: 'typeOfUser')
  final String typeOfUser;
  @HiveField(2)
  @JsonKey(name: 'teacher')
  final Teacher teacher;
  @HiveField(3)
  @JsonKey(name: 'parent')
  final Parent parent;
  @HiveField(4)
  @JsonKey(name: 'principal')
  final Principal principal;
  @HiveField(5)
  @JsonKey(name: 'code')
  final int code;
  @HiveField(6, defaultValue: 0)
  @JsonKey(name: 'phoneNumber', defaultValue: 0, required: false)
  final double? phoneNumber;

  OtpHandshakeResponse({
    required this.token,
    required this.typeOfUser,
    required this.teacher,
    required this.parent,
    required this.principal,
    required this.code,
    this.phoneNumber,
  });

  factory OtpHandshakeResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpHandshakeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpHandshakeResponseToJson(this);
}
