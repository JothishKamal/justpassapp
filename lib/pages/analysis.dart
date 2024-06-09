// ignore_for_file: prefer_const_constructors, camel_case_types, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/widgets/graph_view.dart';

const List<String> subjects = [
  'Differential',
  'Physics',
  'OOPS',
  'English',
  'Psychology',
  'Soft Skills'
];

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  String dropDown1Value = subjects[0];
  String dropDown2Value = subjects[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102032),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, dateState) {
                        return Text(
                          '${dateState.weekday}, ${dateState.day} ${dateState.month} ${dateState.year}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
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
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Aakaash!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFF315F95),
                  thickness: 2,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Analysis',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(width: 20),
                            DropdownButton<String>(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              dropdownColor: const Color(0xFF102032),
                              padding: EdgeInsets.all(5),
                              value: dropDown1Value,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDown1Value = newValue!;
                                });
                              },
                              items: subjects
                                  .map<DropdownMenuItem<String>>((String e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(fontFamily: 'Raleway'),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        // Legend for Graph
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.pink,
                                  radius: 5,
                                ),
                                Text(
                                  ' Expected    ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 5,
                                ),
                                Text(
                                  ' Achieved',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                            height: 300,
                            child: GraphView(
                                isShowingMainData: subjects.indexOf(dropDown1Value) + 1)),
                        const SizedBox(height: 30),
                        const Text(
                          'Performance Overview',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButton<String>(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          dropdownColor: const Color(0xFF102032),
                          padding: EdgeInsets.all(5),
                          value: dropDown2Value,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDown2Value = newValue!;
                            });
                          },
                          items: subjects
                              .map<DropdownMenuItem<String>>((String e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
