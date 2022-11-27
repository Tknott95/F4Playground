import 'package:flutter/material.dart';

/* refactor this into a type */
class WalletLoginProvider extends ChangeNotifier {
  List<String> _bips24Keys = [];

  List<String> get getBips24Keys => _bips24Keys;

  void setBip24Keys(List<String> bips24Keys) {
    print('  BEFORE Bips24Keys: $_bips24Keys');
    _bips24Keys = bips24Keys;
    print('  AFTER Bips24Keys: $_bips24Keys');
  
    notifyListeners();
  }
}
