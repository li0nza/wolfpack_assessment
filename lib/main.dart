import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolfpack_assessment/providers/moment_provider.dart';
import 'package:wolfpack_assessment/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MomentProvider()),
      ],
      child: MaterialApp(
        title: 'Wolfpack Assessment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF3C0038),
          accentColor: const Color(0xFFFEDEBA), ///TODO: stop using accentColor
          backgroundColor: Colors.white,
        ),
        home: const HomePage(),
      ),
    );
  }
}
