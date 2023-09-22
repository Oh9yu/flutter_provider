// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overiview_03/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog', breed: 'dog1', age: 3),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              'Name: ${context.watch<Dog>().name}',
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
          'Breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
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
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Age : ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () => context.read<Dog>().grow(), child: Text('grow up'))
      ],
    );
  }
}
