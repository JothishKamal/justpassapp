import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      : super(const DateState(
            weekday: 'Monday', day: 1, month: 'January', year: 2000));

  void convertDate(int weekday, int day, int month, int year) {
    emit(DateState(
      weekday: _convertWeekday(weekday),
      day: day,
      month: _convertMonth(month),
      year: year,
    ));
  }

  void getCurrentDate() {
    final now = DateTime.now();
    emit(DateState(
      weekday: _convertWeekday(now.weekday),
      day: now.day,
      month: _convertMonth(now.month),
      year: now.year,
    ));
  }

  String _convertWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Error';
    }
  }

  String _convertMonth(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Error';
    }
  }
}
