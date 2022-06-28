import 'package:flutter/material.dart';
import 'package:tut_chat_app/home.dart';
import 'shared/prefs_data_control.dart';
import 'log_in.dart';

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
      home: FutureBuilder<int?>(
        future: getIdFromSF(),
        builder: (context, snapshot) {
          int? id = snapshot.data;
          return id != null ? const MyHomePage(title: '') : const LoginScreen();
        },
      ),
    );
  }
}
