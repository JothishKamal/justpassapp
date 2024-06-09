import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/cubit/recent_activity.dart';
import 'package:justpassapp/cubit/subject_data.dart';
import 'package:justpassapp/widgets/marks.table.dart';

class MarksPage extends StatefulWidget {
  const MarksPage({super.key});

  @override
  State<MarksPage> createState() => _MarksPageState();
}

class _MarksPageState extends State<MarksPage> {
  String? subject;

  String? examType;

  String? expectedGrade;

  TextEditingController classAverage = TextEditingController();
  int? classAvergage;

  Map subjectData = {};

  @override
  Widget build(BuildContext context) {
    final subjectdataCubit = SubjectDataCubit();

    print(subjectdataCubit.state);
    return Scaffold(
      backgroundColor: const Color(0xFF102032),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 10),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(context),
                  const SizedBox(height: 10),
                  salutation("KimmyBae"),
                  const Divider(
                    color: Color(0xFF315F95),
                    thickness: 2,
                  ),
                  const Text(
                    'My Expected Marks',
                    style: TextStyle(
                      color: Colors.white,
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
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/modify-acadDet');
                          },
                          icon:
                              const Icon(Icons.edit, color: fieldbg, size: 20)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  dropDown("Select Subject", subjectdataCubit.state['subjects'],
                      subject, (String? value) {
                    setState(() {
                      subject = value;
                    });
                  }),
                  const SizedBox(height: 10),
                  dropDown("Type of Exam", subjectdataCubit.state['examTypes'],
                      examType, (String? value) {
                    setState(() {
                      examType = value;
                    });
                  }),
                  const SizedBox(height: 10),
                  dropDown("Expected Grade", subjectdataCubit.state['expected'],
                      expectedGrade, (String? value) {
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            subjectdataCubit.updateExamType(examType);

                            subjectdataCubit
                                .updateClassAverage(classAverage.text);
                            subjectdataCubit.updateSubject(subject);
                            subjectdataCubit.updateExpectedGrade(expectedGrade);
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
                          child: const Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "List of Expected Marks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  marksTable(),
                ],
              ),
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

Widget header(BuildContext context) {
  final recentActivityCubit = RecentActivityCubit();
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
      Row(
        children: [
          IconButton(
            onPressed: () {
              recentActivityCubit.updateRecentActivity(recentActivityCubit
                  .state['recentActivity']
                  .sublist(
                      1, recentActivityCubit.state['recentActivity'].length)
                  .toList());
              Navigator.pushNamed(context, '/gemini');
            },
            icon: const Icon(
              Icons.smart_toy,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
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
