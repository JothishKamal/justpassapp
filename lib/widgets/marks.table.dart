import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';

Widget marksTable() {
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
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Engineering Physics')),
              DataCell(Text('80')),
              DataCell(Text('85')),
              DataCell(Text('90')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Engineering Chemistry')),
              DataCell(Text('75')),
              DataCell(Text('80')),
              DataCell(Text('85')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Mathematics')),
              DataCell(Text('70')),
              DataCell(Text('75')),
              DataCell(Text('80')),
            ],
          ),
        ],
      ),
    ),
  );
}
