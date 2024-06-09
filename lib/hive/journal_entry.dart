import 'package:hive/hive.dart';

part 'journal_entry.g.dart';

@HiveType(typeId: 0)
class JournalEntry extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  String date;

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

  JournalEntry copyWith({
    String? title,
    String? content,
    String? date,
    List<String>? imagePaths,
    List<String>? attachmentPaths,
  }) {
    return JournalEntry(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      imagePaths: imagePaths ?? this.imagePaths,
      attachmentPaths: attachmentPaths ?? this.attachmentPaths,
    );
  }
}
