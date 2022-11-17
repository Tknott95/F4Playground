import 'package:flutter/material.dart';
  
class Bip24SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Text("bip24SearchWidget"),
      /* create row type system with dynamic flex box type behaviour and use for loop here after bip search filter */
      /* I want to lock the input with a lock to lock bip or change it for rec (this or use breadcrumbs after input) */
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BipSearchSingle(bipIndex: 1),
          BipSearchSingle(bipIndex: 2),
          BipSearchSingle(bipIndex: 3),
          BipSearchSingle(bipIndex: 4),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /* turn these into loops and make screen size approp */
          BipSearchSingle(bipIndex: 5),
          BipSearchSingle(bipIndex: 6),
          BipSearchSingle(bipIndex: 7),
          BipSearchSingle(bipIndex: 8),
        ],
      )


      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      //     child: TextFormField(
      //       decoration: const InputDecoration(
      //         border: UnderlineInputBorder(),
      //         labelText: 'bip 01',
      //       ),
      //     ),
      //   ),
     ],
    );
    
  }
}

class BipSearchSingle extends StatelessWidget {

  int bipIndex;

  BipSearchSingle({required this.bipIndex});

  void searchBipList(String val) {
    
  }

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: 300,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          /* not using TextFormField for now so I can utilize enabled */
          enabled: true, /* add lock with bool for this so you can only edit one at a time */
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'bip $bipIndex',
          ),
        ),
      ),
  );
  }
}
