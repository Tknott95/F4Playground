import 'package:flutter/material.dart';

/* possibly will change this name (Operations Provider) */

/* refactor this into a type */
class WalletProvider extends ChangeNotifier {
  List<String> _wallsUsing = [];
  String _activeWallet = '';

  List<String> get getWallsUsing => _wallsUsing;
  String get getActiveWall => _activeWallet;

  void setWallsUsing(List<String> wallsUsing) {
    /* calls from api/walls and lists ids here */
    print('  BEFORE wallsUsing: $_wallsUsing');
    _wallsUsing = wallsUsing;
    print('  AFTER wallsUsing: $_wallsUsing');
  
    notifyListeners();
  }


  void setActiveWallet(String activeWall) {
    print('  BEFORE _activeWallet: $_activeWallet');
    _activeWallet = activeWall;
    print('  AFTER _activeWallet: $_activeWallet');
    notifyListeners();
  }
}
