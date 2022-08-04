import "package:flutter/material.dart";

class tableTitle extends StatelessWidget {

  const tableTitle({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final widget = Container(
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          //指定索引及固定列宽
          0: FixedColumnWidth(153.3),
          1: FixedColumnWidth(153.3),
          2: FixedColumnWidth(153.3),
          3: FixedColumnWidth(153.3),
          4: FixedColumnWidth(153.3),
          5: FixedColumnWidth(153.3),
        },
        //設定表格樣式
        border: TableBorder.all(
            color: Colors.grey, width: 2.0, style: BorderStyle.solid),
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Container(
                child: Text(
                  "刪\n除",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
              Container(
                child: Text(
                  "物料\n品號",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
              Container(
                child: Text(
                  "物料\n名稱",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
              Container(
                child: Text(
                  "預警\n天數",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
              Container(
                child: Text(
                  "物料\n單位",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
              Container(
                child: Text(
                  "編\n輯",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              ),
            ],
          ),
        ],
      ),
    );
    return widget;
  }
}