import 'package:flutter/material.dart';
import 'package:flutterapp/top.dart';
import 'package:flutterapp/addPageBody.dart';

class addingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Bar(),
    );

    // 結合AppBar和App操作畫面
    final page = Scaffold(
      appBar: appBar,
      body: addPageBody(),
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
    );

    return page;
  }
}