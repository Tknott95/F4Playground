import 'package:f4pg/providers/wallet_login.provider.dart';
import 'package:f4pg/widgets/bip24Search/bip24-search.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';



// import 'package:provider/provider.dart';


class WalletLoginPage extends StatelessWidget {

  final wallNameCtrl = TextEditingController();  
  final wallPwCtrl = TextEditingController();

  /* could use nested flex and make this look good
   name and pw on left where bip on right etc, but this is just a pg for lgic
   possibly when bored I can tune this bby up, style wise.
   
  */

  @override
  Widget build(BuildContext context) {
    
    List<String> getBipsTest() {
      List<String> _allBips = Provider.of<WalletLoginProvider>(context, listen: false).getBips24Keys;
      return _allBips;
    }

    return Material(
      child: Card(
        // color: const Color.fromARGB(200, 1, 1, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'RECOVER YOUR WALLET',
                style: TextStyle(
                  color: Colors.black12, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 30,
                  ),
                ),
            ),
 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

                const SizedBox(
                  width: 10,
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
              ],
            ),
            SizedBox(
              height: 200,
              child: Bip24SearchWidget()
            ),
            // SizedBox(
            //   width: 200,
            //   child: TextFormField(
            //       decoration: const InputDecoration(
            //       border: UnderlineInputBorder(),
            //       labelText: 'Enter your passowrd',
            //     ),
            //     controller: wallPwCtrl,
            //     // initialValue: 'wallet password',
            //   ),
            // ),

             const Text('USE CUSTOM NODE WIDGET HERE - ADA & ERG'),

             SizedBox(
              height: 200,
              width: 400,
              child: MaterialButton(
                elevation: 100,
                splashColor: Color.fromARGB(133, 171, 187, 255),
                hoverColor: Color.fromARGB(133, 158, 158, 158),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                  ),

                child: const Text(
                  'RECOVER WALLET',
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.w900, 
                    fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    print('fire ${wallNameCtrl.text} at node');
                    print('\n bip24s firing ${getBipsTest()}');
                  },
                ),
            ),
          ],
        ),
      )
    );
  }
}