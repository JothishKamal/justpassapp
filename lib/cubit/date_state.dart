part of 'date_cubit.dart';

class DateState extends Equatable {
  final String weekday;
  final int day;
  final String month;
  final int year;

  const DateState({
    required this.weekday,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  List<Object> get props => [weekday, day, month, year];

  DateState copyWith({
    String? weekday,
    int? day,
    String? month,
    int? year,
  }) {
    return DateState(
      weekday: weekday ?? this.weekday,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }
}
