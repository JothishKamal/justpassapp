import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/cubit/theme_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final _notchBottomBarController = NotchBottomBarController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Exam Journal'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return Switch(
                value: themeState == ThemeState.dark,
                onChanged: (value) {
                  themeCubit.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _notchBottomBarController,
          color: Colors.black,
          notchColor: Colors.black,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.white,
              ),
              activeItem: Icon(
                Icons.home,
                color: Color(0xFF7ED320),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.book,
                color: Colors.white,
              ),
              activeItem: Icon(
                Icons.book,
                color: Color(0xFF7ED320),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.pie_chart,
                color: Colors.white,
              ),
              activeItem: Icon(
                Icons.pie_chart,
                color: Color(0xFF7ED320),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.note,
                color: Colors.white,
              ),
              activeItem: Icon(
                Icons.note,
                color: Color(0xFF7ED320),
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.white,
              ),
              activeItem: Icon(
                Icons.person,
                color: Color(0xFF7ED320),
              ),
            ),
          ],
          onTap: (x) {},
          kIconSize: 24,
          kBottomRadius: 2),
    );
  }
}
