import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/* NEEDS A DESIGN NOW THAT LOGIC IS DONE (rec page also has a wallName and password) */

/* this single nested widget tucked in could always be a locked input (type of render of the bip) to box spawning a modal  */
/* 
* I might make a grid of 24 spots then you can click on each to input the bip.
* Each input brings up the modal up what is already coded to sleect the value via query unitl a design.
*/

var bips24 = {
 0: '',
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
}; /* clear this after rec, you dont want such data persisting */
 
class Bip24SearchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Text("bip24SearchWidget"),
      /* create row type system with dynamic flex box type behaviour and use for loop here after bip search filter */
      /* I want to lock the input with a lock to lock bip or change it for rec (this or use breadcrumbs after input) */

      Expanded(
        // height: 500,
        child: GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 5.5 //10 // 1.2
          ),
          padding: EdgeInsets.zero,
          children: [
            /*
            * I am going to create bipSingle then use this to spawn modals of bipsearchsingle. BipSingle will be a locked input box or button. 
            * This will just be for a framewrok for a design to be built on. */
            /* might be better to set bip24 length at top so it doesnt every time yet it isnt the biggest of deals, yet wasted computation */            
            for (int i=0; i< bips24.length;/*24;*/ i++) BipSearchSingle(bipIndex: i),
          ],
        ),
      )
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
  TextEditingController txtController = TextEditingController(text: '');


  // onInit() {
  //   this.isInputUnlocked = false;
  // }
}

class _BipSearchSingleState extends State<BipSearchSingle> {
  OverlayEntry? entry;
  // final _focusNode = FocusNode();

  List<String> staticBipsList = new File('./bips.txt').readAsLinesSync();
  List<String> bipsList = new File('./bips.txt').readAsLinesSync();

  bool showBipSearch = false;
  // var txtController = TextEditingController();
  // TextEditingController txtController = TextEditingController(text: '');


  void initState() {
    // txtController = new TextEditingController(text: 'Initial value');

    // WidgetsBinding.instance!.addPostFrameCallback((_) { showOverlay(); });

   
    /* could just do it the way i do visibility with hide and show */
    // _focusNode.addListener(() {
    //   if(_focusNode.hasFocus) {
    //     showOverlay();
    //   } else hideOverlay();
    // });
  }

  void showOverlay() {
    final _overlay = Overlay.of(context)!;
    final _renderBox = context.findRenderObject() as RenderBox;
    final _size = _renderBox.size;
    final _offset = _renderBox.localToGlobal(Offset.zero);
  
    entry = OverlayEntry(
      builder: (context) =>  Positioned(
        top: _offset.dy, /*  + _size.height */
        left: _offset.dx + 50,
        width: _size.width,
        child: _bipInputSearch(context)
      ), 
    );

    _overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  void toggleBipSearch() {
    setState(() {
      showBipSearch = !showBipSearch;
    });
  }



  void setBipVal(String val, int bipIndex) {
    print("\n setting bip val ${val}");  

    widget.txtController = TextEditingController(text: val);
      
    bips24[bipIndex] = val;
    print("\n $bips24");

    setState(() {
      bips24[bipIndex] = val;
      print("\n $bips24");

      widget.isInputUnlocked = false;

      widget.bipInputVal = val;


      var tempListForNow = [
        '', '', '', '', '', '', '', '', 
        '', '', '', '', '', '', '', '', 
        '', '', '', '', '', '', '', ''
      ];
      /* if start from 1 then -1 else 0 then leave key as is */
      bips24.forEach((key, value) { tempListForNow[key] = value;});

      print(tempListForNow);

      var tempJson = jsonEncode(tempListForNow);
      print(tempJson);

      showBipSearch = false;
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
    return Container(
      child: Card(
        child: Column(
          children: [
            // ExpansionTile(
            //   title: Row(
            //     children: [
            //       Text("bip-${widget.bipIndex}    "),
            //       Text(widget.bipInputVal.toString()),
            //     ],
            //   ),
            
            // children: [
            //   SizedBox(child:  _bipInputSearch(context))
            //   ],
            // )
            // Visibility(
            //   visible: showBipSearch,
            //   child: _bipInputSearch(context),
            // ),
            MaterialButton( 
              // color: Color.fromARGB(126, 145, 117, 117),
              
              child: Row(
                children: [
                  Text("bip-${widget.bipIndex}    "),
                  Text(widget.bipInputVal.toString()),
                 
                ],
              ),
              // (widget.bipInputVal.toString() != null) ? Text(widget.bipInputVal.toString()) : Text('enter bip-${widget.bipIndex}'), 
              onPressed: () {
                print(widget.bipInputVal.toString());

                showOverlay();

                // toggleBipSearch();
                // showMaterialModalBottomSheet(
                //   context: context,
                //   builder: (context) => _bipInputSearch(context),
                // );

                // showMaterialModalBottomSheet(
                //   context: context,
                //   // barrierDismissible: false,
                //   builder: (context) => SizedBox( height: 400,
                //     child:  Material( child: _bipInputSearch(context)),
                //   ),
                // );
              },
            ),
          ],
        ),
              
        // child: Column(
        //   children: [
        //     Text('${widget.bipInputVal}'),
        //     SizedBox(
        //      width: 100,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        //           child: TextField(
        //             controller: txtController,
        //             onChanged: (val) => searchBipList(val, widget.bipIndex),
        //             /** !!! @NOTE 
        //             * COULD PASS IN widget.INPUT_VAL and then use this to bind into a locked input box 
        //             * BELOW I WILL CLICK ON WHICH bip and then i will set the widget var to such which binds to the input. The bip24 is what will become a json payload with a few other params (this is already done in my wallet)
        //             **/
        //             /* not using TextFormField for now so I can utilize enabled */
        //             // enabled: widget.isInputUnlocked, /* add lock with bool for this so you can only edit one at a time */
        //             decoration: InputDecoration(
        //               border: UnderlineInputBorder(
        //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))
        //               ),
        //               labelText: 'bip ${widget.bipIndex}',
        //             ),
        //           ),
        //         ),
        //       ),
              
        //     // Expanded(
        //     SizedBox(
        //       height: 200, // constrain height
        //       child: ListView.builder(
        //         itemCount: bipsList.length,
        //         shrinkWrap: true,
        //         itemBuilder: (context, index) => ListTile(
        //           title: ElevatedButton(
        //             child: Text(bipsList[index]),
        //             onPressed: () { 
        //               setBipVal(bipsList[index], widget.bipIndex);
        //             },

        //           ), /* button then onClick have a function which sets widget.inputBipVal or something to that item then it binds */
        //         ),
        //       ),
        //     ),

        //   ],
        // ),
      ),
    );
   }

   Widget _bipInputSearch(BuildContext context) {
    return Material(
      // height: 400,
      child: SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text('BIP TOOL HERE - ${widget.bipInputVal.toString()}'),
              
              Column(
                children: [
                  // Text('${widget.bipInputVal}'),
                  SizedBox(
                  width: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          controller: widget.txtController,
                          onChanged: (val) => searchBipList(val, widget.bipIndex),
                          /** !!! @NOTE 
                          * COULD PASS IN widget.INPUT_VAL and then use this to bind into a locked input box 
                          * BELOW I WILL CLICK ON WHICH bip and then i will set the widget var to such which binds to the input. The bip24 is what will become a json payload with a few other params (this is already done in my wallet)
                          **/
                          /* not using TextFormField for now so I can utilize enabled */
                          // enabled: widget.isInputUnlocked, /* add lock with bool for this so you can only edit one at a time */
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0))
                            ),
                            labelText: 'bip ${widget.bipIndex}',
                          ),
                        ),
                      ),
                    ),
                    
                  // Expanded(
                  SizedBox(
                    height: 100, // constrain height
                    child: ListView.builder(

                      itemCount: bipsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        title: MaterialButton(
                          child: Text(bipsList[index]),
                          onPressed: () { 
                            setBipVal(bipsList[index], widget.bipIndex);
                            hideOverlay();
                          },
              
                        ), /* button then onClick have a function which sets widget.inputBipVal or something to that item then it binds */
                      ),
                    ),
                  ),
              
                ],
              ),
            ],
          ),
        ),
      ),
    );
   }
}
