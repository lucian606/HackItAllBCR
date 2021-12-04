import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockScreen extends StatefulWidget {
  StockScreen({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                centerTitle: true, title: const Text("Hack It All - BCR")),
            body: Text("Second screen " + this.widget.message)));
  }
}
