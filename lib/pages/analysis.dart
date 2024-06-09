// ignore_for_file: prefer_const_constructors, camel_case_types, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/cubit/recent_activity.dart';
import 'package:justpassapp/widgets/graph_view.dart';

const List<String> subjects = [
  'Differential',
  'Physics',
  'OOPS',
  'English',
  'Psychology',
  'Soft Skills'
];

const List data = [
  [81, 94, 75, 21.54],
  [75, 85, 65, 15.54],
  [85, 95, 75, 25.54],
  [80, 90, 70, 20.54],
  [70, 80, 60, 10.54],
  [90, 100, 80, 30.54],
];

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  String dropDown1Value = subjects[0];

  final recentActivityCubit = RecentActivityCubit();

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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            recentActivityCubit.updateRecentActivity(
                                recentActivityCubit.state['recentActivity']
                                    .sublist(
                                        1,
                                        recentActivityCubit
                                            .state['recentActivity'].length)
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
                      'KimmyBae!',
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
                                isShowingMainData:
                                    subjects.indexOf(dropDown1Value) + 1)),
                        const SizedBox(height: 30),
                        const Text(
                          'Performance Overview',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Average Mark:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Highest Mark',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Lowest Mark:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Number of exams taken:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Improvement rate:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data[subjects.indexOf(dropDown1Value)][0]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${data[subjects.indexOf(dropDown1Value)][1]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${data[subjects.indexOf(dropDown1Value)][2]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${data[subjects.indexOf(dropDown1Value)][3]}%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
