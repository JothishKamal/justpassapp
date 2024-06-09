import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/subject_data.dart';

class ModifyDetailsPage extends StatefulWidget {
  const ModifyDetailsPage({super.key});

  @override
  State<ModifyDetailsPage> createState() => _ModifyDetailsPageState();
}

class _ModifyDetailsPageState extends State<ModifyDetailsPage> {
  final TextEditingController subjects = TextEditingController();
  final TextEditingController examTypes = TextEditingController();
  final TextEditingController grades = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subjectdataCubit = SubjectDataCubit();
    print(subjectdataCubit.state);

    if (subjectdataCubit.state['subjects'] != "Select Subject") {
      subjects.text = "";
    } else if (subjectdataCubit.state['subjects'] != null) {
      subjects.text = subjectdataCubit.state['subjects'].join(', ');
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Modify Academic Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: primary,
      // need to create text field that takes comma separated values
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title('Subjects'),
              // make large rectangle sized text field
              const SizedBox(height: 15),
              // white color text in the field
              TextField(
                controller: subjects,
                maxLines: 5,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(36, 54, 165, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(36, 54, 165, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              title('Type of Exam'),
              const SizedBox(height: 15),
              TextField(
                controller: examTypes,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(36, 54, 165, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(36, 54, 165, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              title('Grades'),
              const SizedBox(height: 15),
              TextField(
                controller: grades,
                maxLines: 1,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(36, 54, 165, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(36, 54, 165, 255)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        // update the values
                        // extract list of subjects from comma separated value string
                        final List<String> subjectList = subjects.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                        subjectdataCubit.updateSubjects(subjectList);
                        // extract list of exam types from comma separated value string
                        final List<String> examTypeList = examTypes.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                        subjectdataCubit.updateExamTypes(examTypeList);

                        // extract list of grades from comma separated value string
                        final List<String> gradeList = grades.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                        subjectdataCubit.updateExpectedGrades(gradeList);

                        print(subjectdataCubit.state);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            const Color.fromARGB(255, 73, 144, 226),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Update"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget title(String title) {
  return Text(
    title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}
