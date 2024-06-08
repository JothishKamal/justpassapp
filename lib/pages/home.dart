import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:justpassapp/cubit/date_cubit.dart';
import 'package:justpassapp/pages/gemini.dart';

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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<DateCubit, DateState>(
          builder: (context, dateState) {
            return Text(
              '${dateState.weekday}, ${dateState.day} ${dateState.month} ${dateState.year}',
              style: const TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'Raleway'),
            );
          },
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GeminiView()),
                );
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
            fontFamily: 'Newsreader',
          ),
        ),
        Text(
          "Aakaash!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Newsreader',
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              "${_quotesMap[DateTime.now().weekday]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Newsreader',
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
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}

class ReminderBox extends StatelessWidget {
  const ReminderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class RecentActivityBar extends StatelessWidget {
  const RecentActivityBar({super.key});

  @override
  Widget build(BuildContext context) {
    // horizontal list view of recent activities
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
