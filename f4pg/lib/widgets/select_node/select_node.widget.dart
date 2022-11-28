import 'package:f4pg/providers/ops.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SelectNodeWidget extends StatefulWidget {
  // final String node;
  
  const SelectNodeWidget();

  @override
  State<SelectNodeWidget> createState() => _SelectNodeWidgetState();
}

class _SelectNodeWidgetState extends State<SelectNodeWidget> {
  
  void setAdaNode(BuildContext _context, String _nodeUsing) {
   Provider.of<OpsProvider>(_context, listen: false).setAdaNode(_nodeUsing);
  }

  void setErgNode(BuildContext _context, String _nodeUsing) {
   Provider.of<OpsProvider>(_context, listen: false).setErgNode(_nodeUsing);
  }


  @override
  Widget build(BuildContext context) {
   return Text('test');
  }
}