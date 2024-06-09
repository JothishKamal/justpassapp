import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectDataCubit extends Cubit<Map<String, dynamic>> {
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
          'expectedMarks': null,
          'grades': ['S', 'A', 'B', 'C', 'D', 'F'],
          'actualMarks': null,
        });

  void updateSubjects(List<String> subjects) {
    emit({...state, 'subjects': subjects});
  }

  void updateExamTypes(List<String> examTypes) {
    emit({...state, 'examTypes': examTypes});
  }

  void updateSubject(String? subject) {
    emit({...state, 'subject': subject});
  }

  void updateExamType(String? examType) {
    emit({...state, 'examType': examType});
  }

  void updateExpectedMarks(String? expectedMarks) {
    emit({...state, 'expectedMarks': expectedMarks});
  }

  void updateActualMarks(String? actualMarks) {
    emit({...state, 'actualMarks': actualMarks});
  }
}
