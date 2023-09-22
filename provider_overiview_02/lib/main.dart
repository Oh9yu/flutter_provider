import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overiview_02/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Dog>(
      create: (context) => Dog(name: 'kwon', breed: 'bulldog', age: 3),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Name: ${Provider.of<Dog>(context).name} ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            BreedAndAge()
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Breed: ${Provider.of<Dog>(context).breed}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Age : ${Provider.of<Dog>(context).age}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
            child: Text('grow up'))
      ],
    );
  }
}
