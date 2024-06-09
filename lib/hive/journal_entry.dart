import 'package:hive/hive.dart';

part 'journal_entry.g.dart';

@HiveType(typeId: 0)
class JournalEntry extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  List<String> imagePaths;

  @HiveField(4)
  List<String> attachmentPaths;

  JournalEntry({
    required this.title,
    required this.content,
    required this.date,
    this.imagePaths = const [],
    this.attachmentPaths = const [],
  });
}
