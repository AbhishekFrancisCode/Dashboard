import 'package:flutter/material.dart';
import 'package:student_dashboard/pages/start/start_page.dart';
// import 'package:student_dashboard/services/client/remote_repository.dart';
// import 'dart:developer' as devtools show log;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStartPage(),
    );
  }
}

// extension Log on Object {
//   void log() => devtools.log(toString());
// }
