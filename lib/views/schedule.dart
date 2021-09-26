import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wolfpack_assessment/models/moment_model.dart';
import 'package:wolfpack_assessment/providers/moment_provider.dart';
import 'package:wolfpack_assessment/utils/enums.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Moment> moments = Provider.of<MomentProvider>(context).moments;
    return Center(
      child: ListView.builder(
        itemCount: moments.length,
        itemBuilder: (context, index) {
          ///TODO: optomize this, checking like this to display the header is not good at all, and will not work for multi-month views as it
          ///only uses days to compare
          bool showDate = false;
          Moment moment = moments[index];
          Moment? prevMoment;
          if (index == 0) showDate = true;
          if (index - 1 > 0) {
            prevMoment = moments[index - 1];
          }
          if (prevMoment != null && showDate == false) {
            if (moment.date.day != prevMoment.date.day) {
              showDate = true;
            }
          }
          return Column(
            children: [
              if (showDate == true)
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    DateFormat('EEEEE DD MMMM').format(moment.date),
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 22,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              Card(
                color: _getBackgroundColor(moment: moment),
                child: ExpansionTile(
                  title: Text(
                    moment.title,
                    style: TextStyle(color: _getTextColor(moment: moment)),
                  ),
                  leading: Container(
                      width: 40,
                      padding: const EdgeInsets.all(4),
                      child: Image.asset('assets/images/${moment.icon.value}.png')),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        bool _allTaken = _haveTakenMedicine(medicines: moment.medicines);
                        for (var medicine in moment.medicines) {
                          medicine.taken = !_allTaken;
                        }
                      });
                    },
                    child: Container(
                        width: 40,
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(_getCheckboxImage(medicines: moment.medicines))),
                  ),
                  children: [
                    if (moment.isCompleted)
                      Container(
                        color: Colors.lightGreen,
                        height: 4,
                      ),
                    ...moment.medicines
                        .map((Medicine medicine) => ListTile(
                              tileColor: Colors.white,
                              title: Text(
                                medicine.name,
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    medicine.taken = !medicine.taken;
                                  });
                                },
                                child: Container(
                                    width: 40,
                                    padding: const EdgeInsets.all(4),
                                    child: Image.asset(_getCheckboxImage(medicines: [medicine]))),
                              ),
                            ))
                        .toList()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Color _getBackgroundColor({required Moment moment}) {
    bool allDone = _haveTakenMedicine(medicines: moment.medicines);
    moment.isCompleted = allDone;
    return moment.isCompleted ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor;
  }

  Color _getTextColor({required Moment moment}) {
    return moment.isCompleted ? Theme.of(context).accentColor : Colors.black;
  }

  String _getCheckboxImage({required List<Medicine> medicines}) {
    if (_haveTakenMedicine(medicines: medicines)) {
      return 'assets/images/${CheckboxEnum.checkboxCheckedGreen.value}.png';
    }
    return 'assets/images/${CheckboxEnum.checkboxEmpty.value}.png';
  }

  bool _haveTakenMedicine({required List<Medicine> medicines}) {
    if (medicines.where((Medicine medicine) => medicine.taken == false).toList().isNotEmpty) return false;
    return true;
  }
}
