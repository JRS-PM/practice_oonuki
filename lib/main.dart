import 'package:flutter/material.dart';
import 'package:flutter_application_practice3/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //OS上のtitle
      title: 'Flutter Demo Home Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyCounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}
