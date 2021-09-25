import 'package:flutter/foundation.dart';

enum Icon {
  ///TODO: add white icons
  baselineAlarmBlack24pt,
  baselineBusinessCenterBlack24pt,
  baselineClassBlack24pt,
  baselineFreeBreakfastBlack24pt,
  baselineHomeBlack24pt,
  baselineLocalPharmacyBlack24pt,
}
extension IconExtension on Icon {
  String get value => describeEnum(this);
}

enum CheckboxEnum { checkboxEmpty, checkboxCheckedWhite, checkboxCheckedGreen }
extension CheckboxExtension on CheckboxEnum {
  String get value => describeEnum(this);
}
