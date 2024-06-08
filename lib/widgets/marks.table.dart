import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/cubit/subject_data.cubit.dart';

Widget marksTable() {
  final subjectdataCubit = SubjectDataCubit();
  return Container(
    decoration: BoxDecoration(
      color: fieldbg,
      borderRadius: BorderRadius.circular(7),
    ),
    padding: const EdgeInsets.all(10),
    child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
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
          rows: subjectdataCubit.state['subjects'].map<DataRow>((subject) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(subject)),
                const DataCell(Text('80')),
                const DataCell(Text('85')),
                const DataCell(Text('90')),
              ],
            );
          }).toList(),
        )),
  );
}
