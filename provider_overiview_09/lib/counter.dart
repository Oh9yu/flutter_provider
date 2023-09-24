import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
