import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_overiview_13/success_page.dart';

enum AppState {
  initial,
  loading,
  success,
  error,
}

class AppProvider with ChangeNotifier {
  AppState _state = AppState.initial;
  AppState get state => _state;

  Future<void> getResult(BuildContext context, String searchTerm) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      if (searchTerm == 'fail') {
        throw 'Something went wrong';
      }
      _state = AppState.success;
      notifyListeners();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SuccessPage();
          },
        ),
      );
    } catch (e) {
      _state = AppState.error;
      notifyListeners();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Something wrong!!!'),
          );
        },
      );
    }
  }
}
