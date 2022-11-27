import 'package:flutter/material.dart';

/* possibly will change this name (Operations Provider) */

/* refactor this into a type */
class OpsProvider extends ChangeNotifier {
  List<String> _bips24Keys = [];

  /* not going to throw the name or password here */
  /* this will ble cleaned if auth is passed. If not vals will stay for dynamism *.

  List<String> get getBips24Keys => _bips24Keys;

  void setBip24Keys(List<String> bips24Keys) {
    print('  BEFORE Bips24Keys: $_bips24Keys');
    _bips24Keys = bips24Keys;
    print('  AFTER Bips24Keys: $_bips24Keys');
  
    notifyListeners();
  }
}
