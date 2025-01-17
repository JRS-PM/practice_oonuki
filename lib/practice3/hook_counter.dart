import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyCounterPage extends HookWidget {
  const MyCounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'タップした回数が表示されます',
            ),
            Text(
              counter.value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value *= 2,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
