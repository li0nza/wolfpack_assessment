import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/views/schedule.dart';
import 'package:wolfpack_assessment/views/taken.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Wolfpack Assessment'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          unselectedIconTheme: const IconThemeData(color: Colors.black26),
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: 'Taken',
            ),
          ],
        ),
        body: pageIndex == 0 ? const SchedulePage() : const TakenPage());
  }
}
