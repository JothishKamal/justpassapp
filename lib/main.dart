import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/widgets/bottom_bar.dart';
import 'package:justpassapp/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'JustPassApp',
            theme: ThemeData(
              fontFamily: 'Raleway',
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF4A4A4A),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              fontFamily: 'ComicNeue',
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF4A90E2),
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            themeMode: themeState == ThemeState.light
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const BottomBar(),
          );
        },
      ),
    );
  }
}
