import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/hive/journal_entry.dart';
import 'package:justpassapp/pages/entry_page.dart';
import 'package:justpassapp/pages/modify.academic.details.dart';
import 'package:justpassapp/pages/chat_bot.dart';
import 'package:justpassapp/pages/new_entry_page.dart';
import 'package:justpassapp/widgets/bottom_bar.dart';
import 'package:justpassapp/cubit/theme_cubit.dart';
import 'package:justpassapp/cubit/journal_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(JournalEntryAdapter());
  await Hive.openBox<JournalEntry>('journal_entries');

  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<JournalCubit>(
          create: (context) =>
              JournalCubit(Hive.box<JournalEntry>('journal_entries')),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'JustPassApp',
              theme: ThemeData(
                fontFamily: GoogleFonts.poppins().fontFamily,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFF102033),
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                fontFamily: GoogleFonts.poppins().fontFamily,
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
              initialRoute: '/',
              routes: {
                '/': (context) => const BottomBar(),
                '/gemini': (context) => const GeminiView(),
                '/new_entry': (context) => const NewEntryPage(),
                '/entry': (context) => const EntryPage(),
                '/modify-acadDet': (context) => const ModifyDetailsPage(),
              });
        },
      ),
    );
  }
}
