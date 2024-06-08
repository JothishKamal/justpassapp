import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/pages/home.dart';
import 'package:justpassapp/pages/journal.dart';
import 'package:justpassapp/pages/analysis.dart';
import 'package:justpassapp/pages/marks.dart';
import 'package:justpassapp/pages/profile.dart';
import '../cubit/date_cubit.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _pageController = PageController();
  final NotchBottomBarController _notchBottomBarController =
      NotchBottomBarController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateCubit()..getCurrentDate(),
      child: Scaffold(
        backgroundColor: primary,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            JournalPage(),
            AnalysisPage(),
            MarksPage(),
            ProfilePage(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _notchBottomBarController,
          color: const Color(0xffD9D9D9),
          notchColor: const Color(0xffD9D9D9),
          removeMargins: true,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: primary,
              ),
              activeItem: Icon(
                Icons.home,
                color: primary,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.book,
                color: primary,
              ),
              activeItem: Icon(
                Icons.book,
                color: primary,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.stacked_line_chart,
                color: primary,
              ),
              activeItem: Icon(
                Icons.stacked_line_chart,
                color: primary,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.note,
                color: primary,
              ),
              activeItem: Icon(
                Icons.note,
                color: primary,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(Icons.person, color: primary),
              activeItem: Icon(
                Icons.person,
                color: primary,
              ),
            ),
          ],
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          kIconSize: 24,
          kBottomRadius: 1,
        ),
      ),
    );
  }
}
