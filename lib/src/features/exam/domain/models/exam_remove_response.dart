import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';

part 'exam_remove_response.g.dart';

@HiveType(typeId: 16)
@JsonSerializable()
class ExamRemoveResponse {
  @HiveField(0)
  @JsonKey(name: 'Exams')
  final Exam exam;

  ExamRemoveResponse({required this.exam});

  factory ExamRemoveResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamRemoveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamRemoveResponseToJson(this);
}
