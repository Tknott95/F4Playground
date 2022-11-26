import 'package:f4pg/widgets/bip24Search/bip24-search.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletLoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Column(
        children: [
          Bip24SearchWidget(),
        ],
      )
    );
  }
}