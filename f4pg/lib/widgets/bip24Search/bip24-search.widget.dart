import 'package:flutter/material.dart';
import 'dart:io';
 
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
        children: const [
          BipSearchSingle(bipIndex: 1),
          BipSearchSingle(bipIndex: 2),
          BipSearchSingle(bipIndex: 3),
          BipSearchSingle(bipIndex: 4),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
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

  const BipSearchSingle({required this.bipIndex});

  State<BipSearchSingle> createState() => _BipSearchSingleState();
  
}

class _BipSearchSingleState extends State<BipSearchSingle> {

  List<String> staticBipsList = new File('./bips.txt').readAsLinesSync();
  List<String> bipsList = new File('./bips.txt').readAsLinesSync();





  // BipSearchSingle({required this.bipIndex});

  void searchBipList(String val) {
    print(bipsList);

    print('\n $val');

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
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (val) => searchBipList(val),
                  /* not using TextFormField for now so I can utilize enabled */
                  enabled: true, /* add lock with bool for this so you can only edit one at a time */
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
                title: Text(bipsList[index]),
              ),
              // children: const [
              //   Text("HAHLOASDLKASLSHJK"),
              //   Text("HAHLOASDLKASLHJK"),
              //   Text("HAHLOASDLKASLHJK"),
              //   Text("HAHLOASDLKASLHJK"),
              //   Text("HAHLOASDLKASLHJK"),
              // ],
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
