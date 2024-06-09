import 'package:flutter/material.dart';
import 'package:justpassapp/hive/journal_entry.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as JournalEntry;
    return const Placeholder();
  }
}
