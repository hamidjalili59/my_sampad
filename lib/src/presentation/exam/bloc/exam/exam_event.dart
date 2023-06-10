part of 'exam_bloc.dart';

@freezed
class ExamEvent with _$ExamEvent {
  const factory ExamEvent.getExams() = _GetExams;
  const factory ExamEvent.removeExam(int examId) = _RemoveExam;
  const factory ExamEvent.acceptExam(Exam exam) = _AcceptExam;
  const factory ExamEvent.updateExam(Exam exam) = _UpdateExam;
}
