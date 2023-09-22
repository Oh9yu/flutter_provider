import 'package:flutter/material.dart';

void main() {
  runApp(const CountApp());
}

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hompage(),
    );
  }
}

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(20),
              child: Text(
                'Home Page',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CounterA(
              counter: counter,
              increment: increment,
            ),
            SizedBox(
              height: 20,
            ),
            Middle(
              counter: counter,
            )
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;

  const CounterA({super.key, required this.counter, required this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('counterA'),
          SizedBox(
            height: 10,
          ),
          Text(
            '$counter',
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton.icon(
            onPressed: increment,
            icon: Icon(Icons.plus_one_rounded),
            label: Text('Increment'),
          )
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;

  const Middle({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text('counterB'),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CounterB(
                counter: counter,
              ),
              SizedBox(
                width: 10,
              ),
              Sibling(),
            ],
          )
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;

  const CounterB({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3)),
      child: Text('$counter'),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(3)),
      child: Text('Sibling'),
    );
  }
}
