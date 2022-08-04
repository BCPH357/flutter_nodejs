import 'package:flutter/material.dart';
import 'package:flutterapp/set_btn.dart';

class Bar extends StatelessWidget{

  const Bar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var titleText = const Text(
      "虛擬小秘書",
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
    );
    //逾期
    final btn1 = TextButton(
      child: const Text(
        "逾期",
        style: TextStyle(fontSize: 20, color: Colors.white,),
      ),
      onPressed: () => nullfunc(),
    );
    //入庫
    final btn2 = TextButton(
      child: const Text(
        "入庫",
        style: TextStyle(fontSize: 20, color: Colors.white,),
      ),
      onPressed: () => nullfunc(),
    );
    //登出
    final btn3 = TextButton(
      child: const Text(
        "登出",
        style: TextStyle(fontSize: 20, color: Colors.white,),
      ),
      onPressed: () => nullfunc(),
    );
    //設定
    var text1 = const Text(
      "設定",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );

    var setBtn = const setting_btn();

    final leftwidge = Expanded(
      child:Container(
        child: Row (
          children: <Widget>[
            Container(child: titleText, margin: const EdgeInsets.all(10), alignment: Alignment.topCenter,),
            Container(child: btn1, margin: const EdgeInsets.all(10), alignment: Alignment.topCenter,),
            Container(child: btn2, margin: const EdgeInsets.all(10), alignment: Alignment.topCenter,),
            Container(child: text1, margin: const EdgeInsets.fromLTRB(10, 10, 0, 10), alignment: Alignment.topCenter,),
            Container(child: setBtn, margin: const EdgeInsets.fromLTRB(0, 10, 10, 10), alignment: Alignment.topCenter,),
          ],
        )
      ),
    );
    final rightwidge = Container(child: btn3, margin: const EdgeInsets.all(10), alignment: Alignment.topCenter,);

    final topwidge = Container(
      child: Row(
        children: <Widget>[
          leftwidge,
          rightwidge,
        ],
      ),
    );

    return topwidge;
  }
  void nullfunc() {
    ;
  }

}