import 'package:flutter/material.dart';
  
class Bip24SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Text("bip24SearchWidget"),
      /* create row type system with dynamic flex box type behaviour and use for loop here after bip search filter */
      BipSearchSingle(bipIndex: 1),
      BipSearchSingle(bipIndex: 2),
      BipSearchSingle(bipIndex: 3),
      BipSearchSingle(bipIndex: 4),

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

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'bip $bipIndex',
        ),
      ),
    );
  }
}
