import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:io';

var bips24 = {
 1: '',
 2: '',
 3: '',
 4: '',
 5: '',
 6: '',
 7: '',
 8: '',
 9: '',
 10: '',
 11: '',
 12: '',
 13: '',
 14: '',
 15: '',
 16: '',
 17: '',
 18: '',
 19: '',
 20: '',
 21: '',
 22: '',
 23: '',
 24: '',
};
 
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

class BipSearchSingle extends StatefulWidget {
  final int bipIndex;

  String? bipInputVal;
  bool? isInputUnlocked = true;

  BipSearchSingle({required this.bipIndex, this.bipInputVal, this.isInputUnlocked});

  State<BipSearchSingle> createState() => _BipSearchSingleState();
  

  // onInit() {
  //   this.isInputUnlocked = false;
  // }
}

class _BipSearchSingleState extends State<BipSearchSingle> {

  List<String> staticBipsList = new File('./bips.txt').readAsLinesSync();
  List<String> bipsList = new File('./bips.txt').readAsLinesSync();


  // var txtController = TextEditingController();
  TextEditingController txtController = TextEditingController(text: '');


  void initState() {
    // txtController = new TextEditingController(text: 'Initial value');
  }



  void setBipVal(String val, int bipIndex) {
    print("\n setting bip val $val");  

    txtController = TextEditingController(text: val);
      
    bips24[bipIndex] = val;
    print("\n $bips24");

    setState(() {
      widget.isInputUnlocked = false;

      widget.bipInputVal = val;

    });
  }

  // BipSearchSingle({required this.bipIndex});

  void searchBipList(String val, int index) {
    print(bipsList);

    print('\n $val');


   /* need to pass in index */
    bips24[index] = val;

    print("\n $bips24");

    setState(() {
      bipsList = staticBipsList.where((element) => element.toLowerCase().contains(val.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Text('${widget.bipInputVal}'),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: txtController,
                  onChanged: (val) => searchBipList(val, widget.bipIndex),
                  /** !!! @NOTE 
                  * COULD PASS IN widget.INPUT_VAL and then use this to bind into a locked input box 
                  * BELOW I WILL CLICK ON WHICH bip and then i will set the widget var to such which binds to the input. The bip24 is what will become a json payload with a few other params (this is already done in my wallet)
                  **/
                  /* not using TextFormField for now so I can utilize enabled */
                  // enabled: widget.isInputUnlocked, /* add lock with bool for this so you can only edit one at a time */
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))
                    ),
                    labelText: 'bip ${widget.bipIndex}',
                  ),
                ),
              ),
            ),
            
          SizedBox(
            height: 100, // constrain height
            child: ListView.builder(
              itemCount: bipsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                title: ElevatedButton(
                  child: Text(bipsList[index]),
                  onPressed: () { 
                    setBipVal(bipsList[index], widget.bipIndex);
                  },

                ), /* button then onClick have a function which sets widget.inputBipVal or something to that item then it binds */
              ),
            ),
          ),

        ],
      ),
    );
   }
}


class BipStringModel{
  String? val;

  BipStringModel(this.val);
}
