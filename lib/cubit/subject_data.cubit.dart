import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectDataCubit extends Cubit<Map> {
  SubjectDataCubit()
      : super({
          'subject': null,
          'subjects': [
            'Engineering Physics',
            'Engineering Chemistry',
            'Mathematics'
          ],
          'examType': null,
          'examTypes': ['CAT - 1', 'CAT - 2', 'FAT'],
          'expectedGrade': null,
          'expected': ['S', 'A', 'B', 'C', 'F'],
          'classAverage': null,
        });
  void updateSubjects(String? subjects) {
    List<String> subjectList = subjects!.split(',');
    emit(state..['subject'] = subjectList);
  }

  void updateExamTypes(String? examType) {
    List<String> examTypeList = examType!.split(',');
    emit(state..['examType'] = examTypeList);
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
