// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider_overiview_03/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dog = Dog(name: 'kwon', breed: 'booldog');

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListner);
  }

  void dogListner() {
    print('object');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dog.removeListener(dogListner);
  }

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
              'Name: ${dog.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            BreedAndAge(
              dog: dog,
            )
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;

  const BreedAndAge({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Breed: ${dog.breed}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;

  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Age : ${dog.age}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(onPressed: () => dog.grow(), child: Text('grow up'))
      ],
    );
  }
}
