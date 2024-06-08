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
  bool isShowingMainData = false;
  String dropDownValue = subjects[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102032),
      body: SafeArea(
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
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'Hi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Aakaash,',
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
                          value: dropDownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                              isShowingMainData = !isShowingMainData;
                            });
                          },
                          items: subjects.map<DropdownMenuItem<String>>((String e) {
                            return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                              );})
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 300,
                      child: GraphView(isShowingMainData: isShowingMainData)
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Performance Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      dropdownColor: const Color(0xFF102032),
                      padding: EdgeInsets.all(5),
                      value: dropDownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                          isShowingMainData = !isShowingMainData;
                        });
                      },
                      items: subjects.map<DropdownMenuItem<String>>((String e) {
                        return DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                          );})
                          .toList(),
                    ),
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
