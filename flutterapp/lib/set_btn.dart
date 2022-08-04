import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class setting_btn extends StatelessWidget {
  const setting_btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = PopupMenuButton(
      itemBuilder: (context) {
        return const <PopupMenuEntry> [
          PopupMenuItem(
            child: Text("第一項", style: TextStyle(fontSize: 20),),
            value: 1,
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: Text("第二項", style: TextStyle(fontSize: 20),),
            value: 2,
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: Text("第三項", style: TextStyle(fontSize: 20),),
            value: 3,
          ),
        ];
      },
      color: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: const Offset(100, 30),
      onSelected: (value) => _showSnackBar(context, value.toString()),
      onCanceled: () => _showSnackBar(context, '取消選擇'),
    );

    final widget = Center(
      child: btn,
      heightFactor: 2,
    );

    return widget;
  }

  void _showSnackBar(BuildContext context, String msg) {
    // 建立SnackBar物件
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      action: SnackBarAction(
        label: 'Toast訊息',
        textColor: Colors.white,
        onPressed: () =>
            Fluttertoast.showToast(msg: '你按下SnackBar',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 20.0),
      ),
    );

    // 顯示SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
