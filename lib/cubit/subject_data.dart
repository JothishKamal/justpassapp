import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectDataCubit extends Cubit<Map> {
  SubjectDataCubit()
      : super({
          'subject': null,
          'subjects': [
            "Engineering Mathematics",
            "Engineering Physics",
            "Engineering Chemistry"
          ],
          'examType': null,
          'examTypes': ["Cat - 1", "Cat - 2", "FAT"],
          'expectedGrade': null,
          'expected': ['S', 'A', 'B', 'C', 'D', 'F'],
          'classAverage': null,
        });
  void updateSubjects(List<String> subjects) {
    final newState = state;
    newState['subjects'] = subjects;
    emit(newState);
  }

  void updateExamTypes(List<String> examTypes) {
    final newState = state;
    newState['examTypes'] = examTypes;
    emit(newState);
  }

  void updateExpectedGrades(List<String> expectedGrades) {
    emit(state..['expected'] = expectedGrades);
  }

  void updateSubject(String? subject) {
    final newState = state;
    newState['subject'] = subject;
    emit(newState);
  }

  void updateExamType(String? examType) {
    final newState = state;
    newState['examType'] = examType;
    emit(newState);
  }

  void updateExpectedGrade(String? expectedGrade) {
    emit(state..['expectedGrade'] = expectedGrade);
  }

  void updateClassAverage(String? classAverage) {
    emit(state..['classAverage'] = classAverage);
  }
}
