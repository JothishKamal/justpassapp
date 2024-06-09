import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:justpassapp/cubit/recent.activity.cubit.dart';

Map<int, String> _quotesMap = {
  1: "Live as if you were to die tomorrow.",
  2: "An investment in knowledge pays the best interest.",
  3: "The roots of education are bitter, but the fruit is sweet.",
  4: "The mind is not a vessel to be filled, but a fire to be kindled.",
  5: "Learning is a treasure that will follow its owner everywhere.",
  6: "Success has to start somewhere.",
  7: "Education is the movement from darkness to light.",
};

@immutable
class HomePage extends StatelessWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderRow(),
              SizedBox(height: 20),
              WelcomeText(),
              QuoteSection(),
              SizedBox(height: 10),
              SectionTitle(title: "Reminders"),
              SizedBox(height: 10),
              ReminderBox(),
              SizedBox(height: 20),
              SectionTitle(title: "Recent Activity"),
              SizedBox(height: 10),
              RecentActivityBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back,",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "KimmyBae!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5.0),
          child: SvgPicture.asset(
            'assets/images/quotes.svg',
            width: 40,
            height: 40,
          ),
        ),
        Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              "${_quotesMap[DateTime.now().weekday]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            'assets/images/quotes-right.svg',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        (title == "Reminders")
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : Container(),
      ],
    );
  }
}

class ReminderBox extends StatelessWidget {
  const ReminderBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for reminders
    final reminders = [
      {'title': 'Complete Differential Eq. tutorial 1', 'date': '7th June'},
      {'title': 'Revise Physics module 3', 'date': '14th June'},
      {'title': 'Upload English DA 1', 'date': '20th June'},
    ];

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.separated(
          itemCount: reminders.length,
          separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(color: Color.fromRGBO(73, 144, 226, .33))),
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                Icons.radio_button_unchecked,
                color: Color(0xff4990E2),
              ),
              title: Text(
                reminders[index]['title']!,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              subtitle: Text(
                reminders[index]['date']!,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecentActivityBar extends StatelessWidget {
  const RecentActivityBar({super.key});

  @override
  Widget build(BuildContext context) {
    final recentActivityCubit = RecentActivityCubit();
    // horizontal list view of recent activities from cubit
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recentActivityCubit.state['recentActivity'].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recentActivityCubit.state['recentActivity'][index]
                          ['title'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Text(
                      recentActivityCubit.state['recentActivity'][index]
                          ['subtitle'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Text(
                      recentActivityCubit.state['recentActivity'][index]
                          ['date'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Text(
                      recentActivityCubit.state['recentActivity'][index]
                          ['time'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
