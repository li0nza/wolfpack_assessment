import 'package:wolfpack_assessment/utils/enums.dart';

class Moment {
  final String title;
  final Icon icon;
  final List<Medicine> medicines;
  final DateTime date;
  bool isCompleted;

  Moment({
    required this.title,
    required this.icon,
    required this.date,
    required this.medicines,
    required this.isCompleted,
  });
}

class Medicine {
  final String name;
  bool taken;

  Medicine({
    required this.name,
    required this.taken,
  });
}
