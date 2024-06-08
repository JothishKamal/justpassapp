import "package:flutter_bloc/flutter_bloc.dart";
import 'package:intl/intl.dart';

class RecentActivityCubit extends Cubit<Map> {
  RecentActivityCubit()
      : super({
          'recentActivity': [
            {
              'title': 'Started a chat with Gemini',
              'subtitle': '',
              'date': convertDate(DateTime.now()),
              'time': getTime(),
              'category': 'chat',
            },
            {
              'title': 'Updated Engineering Physics',
              'subtitle': 'CAT - 1',
              'date':
                  convertDate(DateTime.now().subtract(const Duration(days: 1))),
              'time': getTime(),
              'category': 'subject',
            },
            {
              'title': 'Updated Engineering Chemistry',
              'subtitle': 'CAT - 1',
              'date':
                  convertDate(DateTime.now().subtract(const Duration(days: 2))),
              'time': getTime(),
              'category': 'subject',
            },
            {
              'title': 'Updated Mathematics',
              'subtitle': 'CAT - 1',
              'date':
                  convertDate(DateTime.now().subtract(const Duration(days: 3))),
              'time': getTime(),
              'category': 'subject',
            },
          ],
        });

  void updateRecentActivity(List recentActivity) {
    emit(state..['recentActivity'] = recentActivity);
  }
}

String convertDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}

// get current time in string
String getTime() {
  return DateFormat('hh:mm a').format(DateTime.now());
}
