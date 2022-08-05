import 'package:flutter/material.dart';
import 'package:flutterapp/top.dart';
import 'editPageBody.dart';

class editingPage extends StatelessWidget {
  final String articleNumber;
  final String name;
  editingPage(this.articleNumber, this.name);

  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Bar(),
    );

    // 結合AppBar和App操作畫面
    final page = Scaffold(
      appBar: appBar,
      body: editPageBody(articleNumber, name),
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
    );

    return page;
  }
}