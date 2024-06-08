import 'package:flutter/material.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

List entryData = [
  {
    'date': '7th June 2024',
    'title':
        'A Heartfelt Day: Celebrating my birthday in the midst of exam season',
    'content':
        'Today was a whirlwind of emotions as I celebrated my birthday amidst the stress of exam season. Despite the looming deadlines and piles of notes, my friends and piles of notes, my friends ...',
  },
  {
    'date': '5th June 2024',
    'title': 'A Day of Reflection: My journey to self-discovery',
    'content':
        'Today was a day of reflection as I embarked on a journey of self-discovery. I spent the day exploring new hobbies and interests, and it was a refreshing change of pace from my usual routine ...',
  },
  {
    'date': '3rd June 2024',
    'title': 'A Day of Adventure: Exploring the great outdoors',
    'content':
        'Today was a day of adventure as I explored the great outdoors. I hiked through the mountains, swam in the crystal-clear waters of the lake, and basked in the warm glow of the sun ...',
  },
  {
    'date': '1st June 2024',
    'title': 'A Day of Creativity: Unleashing my inner artist',
    'content':
        'Today was a day of creativity as I unleashed my inner artist. I spent the day painting, drawing, and creating, and it was a cathartic experience that allowed me to express myself in new ways ...',
  },
  {
    'date': '30th May 2024',
    'title': 'A Day of Relaxation: Taking time to unwind',
    'content':
        'Today was a day of relaxation as I took time to unwind. I indulged in a long bath, read a good book, and enjoyed a leisurely walk in the park. It was a much-needed break from the hustle and bustle of daily life ...',
  },
];

class _JournalPageState extends State<JournalPage> {
  List activeEntries = entryData;
  final searchController = TextEditingController();

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
            header(),
            const SizedBox(height: 10),
            salutation("Aakash"),
            const Divider(
              color: Color(0xFF315F95),
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Journal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          activeEntries = entryData
                              .where((entry) =>
                                  entry['title']
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) ||
                                  entry['content']
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(9),
                        isDense: true,
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
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: activeEntries.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activeEntries[index]['date'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          activeEntries[index]['title'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          activeEntries[index]['content'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
  );
}

Widget salutation(String name) {
  return Row(
    children: [
      const Text(
        'Hi',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Newsreader',
        ),
      ),
      const SizedBox(width: 5),
      Text(
        "$name,",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Newsreader',
        ),
      ),
    ],
  );
}

Widget entry() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Title',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      Text(
        'Content',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    ],
  );
}
