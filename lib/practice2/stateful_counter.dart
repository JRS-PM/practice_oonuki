import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title = "回";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    (
      _counter,
      style: const TextStyle(
        fontSize: 150,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 23, 166, 176),
      ),
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 242, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 234, 219),
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 11, 187, 235),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '$_counter回',
                style: const TextStyle(
                  color: Color.fromARGB(255, 8, 8, 8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // 間隔を追加
          Wrap(
            spacing: 20.0,
            runSpacing: 15.0,
            children: List.generate(_counter, (index) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 85, 196, 209),
                    border: Border.all(color: Colors.black)),
                width: 70,
                height: 70,
                alignment: Alignment.center,
                child: Text('$index'),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
