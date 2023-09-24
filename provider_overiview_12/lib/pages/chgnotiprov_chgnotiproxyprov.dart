import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  const Translations(this._value);
  final int _value;

  String get title => 'You clicked $_value times';
}

class ChgNotiProvChgNotiProxyProv extends StatefulWidget {
  const ChgNotiProvChgNotiProxyProv({Key? key}) : super(key: key);

  @override
  _ChgNotiProvChgNotiProxyProvState createState() =>
      _ChgNotiProvChgNotiProxyProvState();
}

class _ChgNotiProvChgNotiProxyProvState
    extends State<ChgNotiProvChgNotiProxyProv> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider ChagneNotifierProxyProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowTranslations(),
            SizedBox(height: 20.0),
            IncreaseButton(increment: increment),
          ],
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'You clicked 0 times',
      style: TextStyle(fontSize: 28.0),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;
  const IncreaseButton({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
