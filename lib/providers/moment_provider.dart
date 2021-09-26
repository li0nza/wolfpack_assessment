import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wolfpack_assessment/models/moment_model.dart';
import 'package:wolfpack_assessment/services/moment_api.dart';

class MomentProvider extends ChangeNotifier {
  final List<Moment> _moments = MomentApi.instance.getMoments();

  List<Moment> get moments => _moments;

  Map<int, Map<String, int>> getMedicineTaken() {
    Map<int, Map<String, int>> weeks = {};
    ///TODO: refactor, some code can be re-used and optomized here
    for (Moment moment in _moments) {
      Map<String, int> medsForMoment = {};
      int weekNum = weekNumber(moment.date);
      if (weeks.containsKey(weekNum)) {
        Map<String, int>? weekValues = weeks[weekNum];
        for (Medicine medicine in moment.medicines) {
          if (medicine.taken == true) {
            if (weekValues != null) {
              if (weekValues.containsKey(medicine.name)) {
                weekValues[medicine.name] = weekValues[medicine.name]! + 1;
              } else {
                weekValues.addAll({medicine.name: 1});
              }
            }
          }
        }
      } else {
        for (Medicine medicine in moment.medicines) {
          if (medicine.taken == true) {
            if (medsForMoment.containsKey(medicine.name)) {
              medsForMoment[medicine.name] = medsForMoment[medicine.name]! + 1;
            } else {
              medsForMoment.addAll({medicine.name: 1});
            }
          }
        }
        if (medsForMoment.isNotEmpty) {
          weeks.addAll({weekNum: medsForMoment});
        }
      }
    }
    return weeks;
  }

  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}
