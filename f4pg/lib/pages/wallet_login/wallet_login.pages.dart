import 'package:f4pg/widgets/bip24Search/bip24-search.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';


class WalletLoginPage extends StatelessWidget {

  final wallNameCtrl = TextEditingController();  
  final wallPwCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        // color: const Color.fromARGB(200, 1, 1, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text('wallet login playground'),
            ),
 
            SizedBox(
              width: 200,
              child: TextFormField(
                 decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your wallet name',
                ),
                controller: wallNameCtrl,
                // initialValue: 'wallet name',
              ),
            ),
            SizedBox(
              height: 200,
              child: Bip24SearchWidget()
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your passowrd',
                ),
                controller: wallPwCtrl,
                // initialValue: 'wallet password',
              ),
            ),

             SizedBox(
              height: 200,
              width: 400,
              child: MaterialButton(
                child: Text('recover wallet'),
                onPressed: () {
                  print('fire ${wallNameCtrl.text} at node');
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}