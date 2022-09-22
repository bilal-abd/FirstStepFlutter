import 'package:flutter/material.dart';

void main() => runApp(const CounterApplication());

class CounterApplication extends StatelessWidget {
  const CounterApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exercice 2',
      home: CounterScreenState(),
    );
  }
}

class CounterScreenState extends StatefulWidget {
  const CounterScreenState({super.key});

  @override
  CounterScreen createState() => CounterScreen();
}

class CounterScreen extends State<CounterScreenState> {
  int _count = 0;
  void _incrementCount() {
    if (_count > 998) {
      return;
    }
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count < 1) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Créer un Widget Statefull'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Quantité",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _decrementCount,
              shape: const CircleBorder(
                  side: BorderSide(
                      width: 2, color: Color.fromARGB(255, 3, 56, 99))),
              child: const Icon(
                Icons.remove,
                color: Color.fromARGB(255, 3, 56, 99),
              ),
            ),
            Text("$_count",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _incrementCount,
              shape: const CircleBorder(
                  side: BorderSide(
                      width: 2, color: Color.fromARGB(255, 3, 56, 99))),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 3, 56, 99),
              ),
            )
          ],
        ),
      ),
    );
  }
}
