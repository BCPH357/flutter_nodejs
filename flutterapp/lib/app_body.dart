import 'package:flutter/material.dart';
import 'package:flutterapp/database.dart';
import 'package:flutterapp/table_title.dart';
import 'addPage.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleText = const Text(
      "基本資料",
      style: TextStyle(
        fontSize: 40,
        color: Colors.black,
        fontWeight: FontWeight.w200,
      ),
      textAlign: TextAlign.center,
    );
    //編輯
    var text1 = const Text(
      "編輯",
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w100,
      ),
      textAlign: TextAlign.center,
    );

    //匯出
    final btn1 = ElevatedButton(
      child: const Text(
        "匯出",
        style: TextStyle(fontSize: 20, color: Colors.white,),
      ),
      onPressed: () => nullfunc(),
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
      ),
    );

    //新增
    final btn2 = ElevatedButton(
      child: const Text(
        "新增",
        style: TextStyle(fontSize: 20, color: Colors.white,),
      ),
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => addingPage())),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
    );

    final threeitem = Container(
        child: Row(
          children: <Widget>[
            Expanded(child:
              Container(child: text1,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, top: 10)
              ),
                flex: 1,
            ),

            Expanded(child: Row(
              children: <Widget>[
                Container(child: btn1,
                    margin: const EdgeInsets.only(top: 10)
                ),
                Container(child: btn2,
                    margin: const EdgeInsets.only(left: 10, top: 10)
                ),
              ]
              ),
              flex: 2  ,
            )
          ],
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
      ),
      margin: const EdgeInsets.only(bottom: 20),
    );
    final title = Container(
      child: titleText,
      alignment: Alignment.topCenter,
      //margin: const EdgeInsets.fromLTRB(500, 0, 500, 200),
      //padding: EdgeInsets.only(top: 1),
      margin: const EdgeInsets.only(bottom: 50),
      color: Colors.white,
    );

    final dataBase = MyHomePage();

    final mainScreen = Container(
      child: Column(
        children: <Widget>[
          threeitem,
          tableTitle(),
          dataBase,
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.white,
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
  void nullfunc() {
    ;
  }
}