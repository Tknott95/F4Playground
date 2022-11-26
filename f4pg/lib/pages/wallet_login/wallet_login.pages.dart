import 'package:f4pg/widgets/bip24Search/bip24-search.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletLoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        // color: const Color.fromARGB(200, 1, 1, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                initialValue: 'wallet name',
              ),
            ),
            SizedBox(
              height: 200,
              child: Bip24SearchWidget()
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                initialValue: 'wallet password',
              ),
            ),

             SizedBox(
              height: 200,
              width: 400,
              child: MaterialButton(
                child: Text('recover wallet'),
                onPressed: () {
                  print('fire at node');
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}