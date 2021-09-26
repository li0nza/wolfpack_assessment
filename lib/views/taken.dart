import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolfpack_assessment/providers/moment_provider.dart';

class TakenPage extends StatelessWidget{
  const TakenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, int>> medicineTaken = Provider.of<MomentProvider>(context).getMedicineTaken();

    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: medicineTaken.length,
        itemBuilder: (context, index) {
          int week = medicineTaken.keys.elementAt(index);
          Map<String, int> weeksMedsTaken = medicineTaken.values.elementAt(index);
          return Column(
            children: [
              Container(
                child: Text(
                  'Medicine taken for week: $week',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black26,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, bottom: 8),
                ///TODO: fix nested listviews and having to force heights
                height: 22.0 * weeksMedsTaken.length + 4,
                child: ListView.builder(
                    itemCount: weeksMedsTaken.length,
                    itemBuilder: (context, i) {
                      String name = weeksMedsTaken.keys.elementAt(i);
                      int count = weeksMedsTaken.values.elementAt(i);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text(
                                '$count',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      );
                    }),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
