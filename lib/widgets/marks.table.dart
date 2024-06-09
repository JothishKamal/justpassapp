import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/subject_data.dart';

Widget marksTable(BuildContext context) {
  return BlocBuilder<SubjectDataCubit, Map<String, dynamic>>(
    builder: (context, state) {
      final subjects = state['subjects'] ?? [];
      final subject = state['subject'];
      final examType = state['examType'];
      final expectedMarks = state['expectedMarks'] ?? '';
      final actualMarks = state['actualMarks'] ?? '';

      return Container(
        decoration: BoxDecoration(
          color: fieldbg,
          borderRadius: BorderRadius.circular(7),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            horizontalMargin: 18,
            dataRowHeight: 40,
            headingRowHeight: 50,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Subject',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'CAT - 1',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'CAT - 2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'FAT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: subjects.map<DataRow>((subject) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(subject)),
                  DataCell(Text(expectedMarks.toString())),
                  DataCell(Text(actualMarks.toString())),
                  const DataCell(Text('90')), // Example static value
                ],
              );
            }).toList(),
          ),
        ),
      );
    },
  );
}
