import 'package:flutter/material.dart';

/* refactor this into a type */
class OpsProvider extends ChangeNotifier {
  /* turn into a type with both nodes */
  String _ergNodeUsing = '';
  String _adaNodeUsing = '';

  String get getAdaNode => _adaNodeUsing;
  String get getErgNode => _ergNodeUsing;

  void setErgNode(String ergNodeUsing) {
    print('  BEFORE _ergNodeUsing: $_ergNodeUsing');
    _ergNodeUsing = ergNodeUsing;
    print('  AFTER _ergNodeUsing: $_ergNodeUsing');
  
    notifyListeners();
  }

    void setAdaNode(String adaNodeUsing) {
    print('  BEFORE _adaNodeUsing: $_adaNodeUsing');
    _adaNodeUsing = adaNodeUsing;
    print('  AFTER _adaNodeUsing: $_adaNodeUsing');
  
    notifyListeners();
  }
}