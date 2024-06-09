import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:hive/hive.dart';
import 'package:justpassapp/hive/journal_entry.dart';

part 'journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  final Box<JournalEntry> journalBox;

  JournalCubit(this.journalBox) : super(JournalInitial());

  void loadJournalEntries() {
    final entries = journalBox.values.toList();
    emit(JournalLoaded(entries));
  }

  void searchJournalEntries(String query) {
    final entries = journalBox.values
        .where(
          (entry) =>
              entry.title.toLowerCase().contains(query.toLowerCase()) ||
              entry.content.toLowerCase().contains(query.toLowerCase()) ||
              entry.date.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    emit(JournalLoaded(entries));
  }

  void addJournalEntry(String title, String content, List<String> imagePaths,
      List<String> attachmentPaths) {
    final newEntry = JournalEntry(
      title: title,
      content: content,
      date: formatDate(DateTime.now().toIso8601String()),
      imagePaths: imagePaths,
      attachmentPaths: attachmentPaths,
    );
    journalBox.add(newEntry);
    loadJournalEntries();
  }
}

// convert ISO8601 string to DateTime - 6 June 2024
String formatDate(String date) {
  final parsedDate = DateTime.parse(date);
  return DateFormat('d MMMM y').format(parsedDate);
}
