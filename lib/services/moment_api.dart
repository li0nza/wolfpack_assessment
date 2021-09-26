import 'package:wolfpack_assessment/models/moment_model.dart';
import 'package:wolfpack_assessment/utils/enums.dart';

class MomentApi {
  static MomentApi? _instance;
  MomentApi._();
  static MomentApi get instance => _instance ??= MomentApi._();

  Moment breakfast({required String day}) => Moment(
        title: "Ontbijt",
        icon: IconEnum.baselineFreeBreakfastBlack24pt,
        date: DateTime.parse("2019-01-$day 08:00"),
        medicines: [Medicine(name: "Paracetamol", taken: false), Medicine(name: "Vitamine C", taken: false)],
        isCompleted: false,
      );
  Moment lunch({required String day}) => Moment(
        title: "Lunch",
        icon: IconEnum.baselineHomeBlack24pt,
        date: DateTime.parse("2019-01-$day 12:00"),
        medicines: [Medicine(name: "Acebutol", taken: false)],
        isCompleted: false,
      );
  Moment atWork({required String day}) => Moment(
        title: "Op 't werk",
        icon: IconEnum.baselineBusinessCenterBlack24pt,
        date: DateTime.parse("2019-01-$day 15:00"),
        medicines: [Medicine(name: "Paracetamol", taken: false)],
        isCompleted: false,
      );
  Moment bedTime({required String day}) => Moment(
        title: "Voor het slapen",
        icon: IconEnum.baselineAlarmBlack24pt,
        date: DateTime.parse("2019-01-$day 22:00"),
        medicines: [Medicine(name: "Melatonin", taken: false)],
        isCompleted: false,
      );

  List<Moment> getMoments() {
    List<Moment> moments = [];
    moments.add(breakfast(day: "01"));
    moments.add(lunch(day: "01"));
    moments.add(breakfast(day: "02"));
    moments.add(lunch(day: "02"));
    moments.add(atWork(day: "02"));
    moments.add(breakfast(day: "03"));
    moments.add(lunch(day: "03"));
    moments.add(breakfast(day: "04"));
    moments.add(atWork(day: "04"));
    moments.add(breakfast(day: "06"));
    moments.add(lunch(day: "06"));
    moments.add(atWork(day: "06"));
    moments.add(bedTime(day: "07"));
    moments.add(breakfast(day: "08"));
    moments.add(lunch(day: "08"));
    moments.add(breakfast(day: "09"));
    moments.add(lunch(day: "09"));
    moments.add(atWork(day: "09"));
    moments.add(breakfast(day: "10"));
    moments.add(lunch(day: "10"));
    moments.add(breakfast(day: "11"));
    moments.add(atWork(day: "11"));
    moments.add(breakfast(day: "13"));
    moments.add(lunch(day: "13"));
    moments.add(atWork(day: "13"));
    moments.add(bedTime(day: "14"));
    return moments;
  }
}
