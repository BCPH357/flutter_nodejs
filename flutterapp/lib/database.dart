import 'package:flutter/material.dart';
import 'package:flutterapp/student.dart';


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

    final deleteBtn = IconButton(
      icon: const Icon(
        Icons.delete_forever_outlined,
      ),
      onPressed: () => nullfunc(),
    );

    final editBtn = IconButton(
      icon: const Icon(
        Icons.edit_outlined,
      ),
      onPressed: () => nullfunc(),
    );

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
                            child: deleteBtn,
                          ),
                          Container(
                            child: Text(
                              snapshot.data![i]['articlenumber'],
                              style: TextStyle(
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
                              style: TextStyle(
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
                              style: TextStyle(
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
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          ),
                          Container(
                            child: editBtn,
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
  void nullfunc() {
    ;
  }
}
