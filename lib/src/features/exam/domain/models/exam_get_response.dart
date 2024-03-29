import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';

part 'exam_get_response.g.dart';

@HiveType(typeId: 17)
@JsonSerializable()
class ExamGetResponse {
  @HiveField(0)
  @JsonKey(name: 'Exams')
  final List<Exam> exams;

  ExamGetResponse({required this.exams});

  factory ExamGetResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamGetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamGetResponseToJson(this);
}
