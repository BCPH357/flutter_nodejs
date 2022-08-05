import 'package:flutter/material.dart';
import 'package:flutterapp/student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'editPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Student studentService = Student();
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> dlgResult = ValueNotifier(null);

    return  Container(
      child: FutureBuilder<List>(
        future: studentService.getAllStudent(),
        builder: (context, snapshot) {
          print(snapshot.data);

          if (snapshot.hasData) {

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {

                return Container(
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      //指定索引及固定列宽
                      0: FixedColumnWidth(100.0),
                      1: FixedColumnWidth(100.0),
                      2: FixedColumnWidth(100.0),
                      3: FixedColumnWidth(100.0),
                      4: FixedColumnWidth(100.0),
                      5: FixedColumnWidth(100.0),
                    },
                    //設定表格樣式
                    border: TableBorder.all(
                        color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Container(
                            //delete bottom
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                              ),
                            onPressed: () async {
                              var data = returnDeleteDate(snapshot.data![i]['articlenumber'], snapshot.data![i]['name']);
                              var ans = await _showDialog(context, data);
                              //dlgResult.value = ans;
                            },
                            ),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![i]['articlenumber'],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![i]['name'],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![i]['day'],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          ),
                          Container(
                            child: Text(
                              snapshot.data![i]['quantity'],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          ),
                          Container(
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit_outlined,
                              ),
                              onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) => editingPage(snapshot.data![i]['articlenumber'], snapshot.data![i]['name']))),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }

          else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ),
    );

  }

  Future<http.Response> deleteTOBackend(String msg) {
    return http.post(
      Uri.parse('http://localhost:8000/api/v1/students'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        //title means instruction(status)
        //name means insert data
        'title': "delete",
        'name': msg,

        //'tel': title,
      }),
    );
  }

  _showDialog(BuildContext context, String deleteMsg) async {
    var dlg = AlertDialog(
      content: const Text('確認刪除？'),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      contentTextStyle: const TextStyle(color: Colors.black, fontSize: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "確定",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () {
            deleteTOBackend(deleteMsg);
            Navigator.pop(context, 1);
          }
        ),

        TextButton(
          child: const Text(
            "取消",
            style: TextStyle(color: Colors.black45, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, -1),
        ),
      ],
    );

    var ans = showDialog(
      context: context,
      builder: (context) => dlg,
    );

    return ans;
  }
  String returnDeleteDate(String articlenumber, String name) {
    var ans = articlenumber + "@" + name;
    return ans;
  }

  void nullfunc() {
    ;
  }
}
