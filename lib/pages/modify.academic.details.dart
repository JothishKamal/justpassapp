import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/subject_data.dart';

class ModifyDetailsPage extends StatefulWidget {
  const ModifyDetailsPage({super.key});

  @override
  State<ModifyDetailsPage> createState() => _ModifyDetailsPageState();
}

class _ModifyDetailsPageState extends State<ModifyDetailsPage> {
  final TextEditingController subjectsController = TextEditingController();
  final TextEditingController examTypesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load initial data
    final cubit = context.read<SubjectDataCubit>();
    subjectsController.text = cubit.state['subjects'].join(', ');
    examTypesController.text = cubit.state['examTypes'].join(', ');
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<SubjectDataCubit, Map<String, dynamic>>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title('Subjects'),
                  const SizedBox(height: 15),
                  TextField(
                    controller: subjectsController,
                    maxLines: 5,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(36, 54, 165, 255),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
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
                    controller: examTypesController,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(36, 54, 165, 255),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
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
                            // Update the values
                            final List<String> subjectList = subjectsController
                                .text
                                .split(',')
                                .map((e) => e.trim())
                                .toList();
                            final List<String> examTypeList =
                                examTypesController.text
                                    .split(',')
                                    .map((e) => e.trim())
                                    .toList();

                            context
                                .read<SubjectDataCubit>()
                                .updateSubjects(subjectList);
                            context
                                .read<SubjectDataCubit>()
                                .updateExamTypes(examTypeList);

                            // navigate back
                            Navigator.pop(context);

                            print(context.read<SubjectDataCubit>().state);
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
          );
        },
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
