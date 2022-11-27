import 'package:flutter/material.dart';

/* refactor this into a type */
class WalletLoginProvider extends ChangeNotifier {
  List<String> Bips24Keys = [];

  void setBip24Keys(List<String> _bips24Keys) {
    print('  BEFORE Bips24Keys: $Bips24Keys');
    Bips24Keys = _bips24Keys;
    print('  AFTER Bips24Keys: $Bips24Keys');
  
    notifyListeners();
  }
}
