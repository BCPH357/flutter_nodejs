import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class addPageBody extends StatelessWidget {
  const addPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputData = "";

    var titleText = const Text(
      "編輯基本資料",
      style: TextStyle(
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      textAlign: TextAlign.center,
    );

    var text1 = Container(
      child: const Text(
        "物料品號",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.center,
      ),
      //margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.all(11),
      decoration:  BoxDecoration(
          color: Colors.grey.shade200,
          border: const Border(
            right: BorderSide(
              color: Colors.black12,
              width: 3,
            ),
            bottom: BorderSide(
              color: Colors.black12,
              width: 3,
            )
          )
      ),
    );

    var text2 = Container(
      child: const Text(
        "物料名稱",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.center,
      ),
      //margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: const Border(
              right: BorderSide(
                color: Colors.black12,
                width: 3,
              ),
              bottom: BorderSide(
              color: Colors.black12,
              width: 3,
              )
          )
      ),
    );

    var text3 = Container(
      child: const Text(
        "預警天數",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.center,
      ),
      //margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: const Border(
              right: BorderSide(
                color: Colors.black12,
                width: 3,
              ),
              bottom: BorderSide(
                color: Colors.black12,
                width: 3,
              )
          )
      ),
    );

    var text4 = Container(
      child: const Text(
        "物料單位",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        textAlign: TextAlign.center,
      ),
      //margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: const Border(
              right: BorderSide(
                color: Colors.black12,
                width: 3,
              ),
              bottom: BorderSide(
                color: Colors.black12,
                width: 3,
              )
          )
      ),
    );

    final nameController = TextEditingController();
    final nameField = Container(
      child: TextField(
        controller: nameController,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          labelText: '物料名稱',
          labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );

    final articleNumberController = TextEditingController();
    final articleNumberField = Container(
      child: TextField(
        controller: articleNumberController,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          labelText: '物料品號',
          labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );

    final dayController = TextEditingController();
    final dayField = Container(
      child: TextField(
        controller: dayController,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          labelText: '提醒天數',
          labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );

    final quantityController = TextEditingController();
    final quantityField = Container(
      child: TextField(
        controller: quantityController,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          labelText: '物料單位',
          labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );

    Future<http.Response> insertTOBackend(String msg) {
      return http.post(
        Uri.parse('http://localhost:8000/api/v1/students'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          //title means instruction(status)
          //name means insert data
          'title': "insert",
          'name': msg,

          //'tel': title,
        }),
      );
    }

    final btn = ElevatedButton(
      child: const Text('確定'),
      onPressed: () {
        inputData = insertAndExit(articleNumberController.text, nameController.text, dayController.text, quantityController.text);
        insertTOBackend(inputData);
        Navigator.pop(context);
      }
    );

    final btnWidget = Container(
      child: btn,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
    );


    final title = Container(
      child: titleText,
      alignment: Alignment.topCenter,
      //margin: const EdgeInsets.fromLTRB(500, 0, 500, 200),
      //padding: EdgeInsets.only(top: 1),
      margin: const EdgeInsets.only(bottom: 50),
      color: Colors.white,
    );

    final articleNumberRow = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: text1,
            flex: 1,
          ),

          Expanded(
            child: articleNumberField,
            flex: 3,
          ),
        ],
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    final nameRow = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: text2,
            flex: 1,
          ),

          Expanded(
            child: nameField,
            flex: 3,
          ),
        ],
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    final dayRow = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: text3,
            flex: 1,
          ),

          Expanded(
            child: dayField,
            flex: 3,
          ),
        ],
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    final quantityRow = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: text4,
            flex: 1,
          ),

          Expanded(
            child: quantityField,
            flex: 3,
          ),
        ],
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );


    final mainScreen = Container(
      child: Column(
        children: <Widget>[
          articleNumberRow,
          nameRow,
          dayRow,
          quantityRow,
          btnWidget,
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(left: 150, right: 150),
    );


    final appWidget = Container(
      child: Column(
        children: <Widget>[
          title,
          mainScreen,
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      margin: const EdgeInsets.only(left: 500, right: 500),
    );
    return appWidget;

    }
  }
  //add all arguments(String) divide with , .
  String insertAndExit(String articleNumber, String name, String day, String quantity) {
    var divider = "@";
    var ans = articleNumber + divider + name +divider +day + divider + quantity;
    return ans;
}