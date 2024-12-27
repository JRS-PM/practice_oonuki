import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 1; // 初期値
  }

  void doubleValue() {
    state *= 2;
  }
}

final counterProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class MyCounterPage extends ConsumerWidget {
  const MyCounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
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
              counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).doubleValue(),
        tooltip: 'Double',
        child: const Icon(Icons.add),
      ),
    );
  }
}
