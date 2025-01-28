import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' show ProviderScope;
import 'practice4/article_counter.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyArticlePage(title: 'Article Page'),
    );
  }
}
