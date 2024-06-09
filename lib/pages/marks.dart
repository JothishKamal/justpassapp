import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/cubit/subject_data.cubit.dart';
import 'package:justpassapp/widgets/marks.table.dart';

class MarksPage extends StatefulWidget {
  const MarksPage({super.key});

  @override
  State<MarksPage> createState() => _MarksPageState();
}

class _MarksPageState extends State<MarksPage> {
  String? subject;
  List<String> subjects = [
    'Engineering Physics',
    'Engineering Chemistry',
    'Mathematics'
  ];

  String? examType;
  List<String> examTypes = ['CAT - 1', 'CAT - 2', 'FAT'];

  String? expectedGrade;
  List<String> expected = ['S', 'A', 'B', 'C', 'F'];

  TextEditingController classAverage = TextEditingController();
  int? classAvergage;

  @override
  Widget build(BuildContext context) {
    final subjectdataCubit = SubjectDataCubit();
    return Scaffold(
      backgroundColor: const Color(0xFF102032),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                const SizedBox(height: 10),
                salutation("Aakaash"),
                const Divider(
                  color: Color(0xFF315F95),
                  thickness: 2,
                ),
                const Text(
                  'My Expected Marks',
                  style: TextStyle(
                    color: fieldbg,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Enter Marks",
                      style: TextStyle(
                        color: fieldbg,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: fieldbg, size: 20)),
                  ],
                ),
                const SizedBox(height: 10),
                dropDown("Select Subject", subjects, subject, (String? value) {
                  subjectdataCubit.updateSubject(value);
                  setState(() {
                    subject = value;
                  });
                }),
                const SizedBox(height: 10),
                dropDown("Type of Exam", examTypes, examType, (String? value) {
                  subjectdataCubit.updateExamType(value);
                  setState(() {
                    examType = value;
                  });
                }),
                const SizedBox(height: 10),
                dropDown("Expected Grade", expected, expectedGrade,
                    (String? value) {
                  subjectdataCubit.updateExpectedGrade(value);
                  setState(() {
                    expectedGrade = value;
                  });
                }),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: fieldbg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: classAverage,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        classAvergage = int.parse(value);
                        subjectdataCubit.updateClassAverage(value);
                      }
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      hintText: 'Class average',
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Submit"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 73, 144, 226),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "List of Expected Marks",
                  style: TextStyle(
                    color: fieldbg,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                marksTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDown(String hint, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: fieldbg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
          isExpanded: true,
          isDense: true,
          underline: const SizedBox(),
          items: items.map((String e) => dropdownItem(e)).toList(),
          onChanged: onChanged,
          value: selectedValue,
          hint: Text(
            '$hint ',
            style: const TextStyle(
              color: Colors.black,
            ),
          )),
    );
  }
}

Widget header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      BlocBuilder<DateCubit, DateState>(
        builder: (context, dateState) {
          return Text(
            '${dateState.weekday}, ${dateState.day} ${dateState.month} ${dateState.year}',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          );
        },
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          size: 28,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget salutation(String name) {
  return Row(
    children: [
      const Text(
        'Hi, ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "$name!",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    ],
  );
}

DropdownMenuItem<String> dropdownItem(String title) {
  return DropdownMenuItem<String>(
    value: title,
    child: Text(title, style: const TextStyle(color: Colors.black)),
  );
}
