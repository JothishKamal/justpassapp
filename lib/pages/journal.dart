import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
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
                      fontWeight: FontWeight.bold),
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
            const Text(
              'My Journal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              child: const TextField(
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
