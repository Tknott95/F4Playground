import 'package:f4pg/providers/ops.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectNodeWidget extends StatefulWidget {
  // final String node;
  
  SelectNodeWidget();

  @override
  State<SelectNodeWidget> createState() => _SelectNodeWidgetState();
}

class _SelectNodeWidgetState extends State<SelectNodeWidget> {
  
  final adaNodeCtrl = TextEditingController();
  final ergNodeCtrl = TextEditingController();

  bool usingCustomNode = false;

  @override
  void initState() {

    setState(() {
      adaNodeCtrl.text = '192.168.0.1:6969';
      ergNodeCtrl.text = '192.168.0.1:6969';
    });
  }

  void setAdaNode(BuildContext _context, String _nodeUsing) {
   Provider.of<OpsProvider>(_context, listen: false).setAdaNode(_nodeUsing);
  }

  void setErgNode(BuildContext _context, String _nodeUsing) {
   Provider.of<OpsProvider>(_context, listen: false).setErgNode(_nodeUsing);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* 
          PUT A SWITCH HERE THAT LOCKS AND UNLOCKS INPUT BOXES
          ADD A TPGGLE TO RESET TO DEFAULTS
        */
        Row(
          children: [
            const Text(
              'RUN CUSTOM NODE?'
            ),
            Switch.adaptive(
              value: usingCustomNode,
              onChanged: (bool val) {
                setState(() {
                  usingCustomNode = !usingCustomNode;
                });
              }
            )
          ],
        ),
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'custom ada node',
                ),
                controller: adaNodeCtrl,
                 onChanged: ((val) => {
                  setAdaNode(context, val)
                }),
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
                  labelText: 'custom erg node',
                ),
                controller: ergNodeCtrl,
                onChanged: ((val) => {
                  setErgNode(context, val)
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}