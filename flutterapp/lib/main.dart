import 'package:flutter/material.dart';
import 'package:flutterapp/top.dart';
import 'package:flutterapp/app_body.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  //createAlbum();
  runApp(const MyApp());
}

/*
Future<http.Response> createAlbum() {
  return http.post(
    Uri.parse('http://localhost:8000/api/v1/students'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': "title",
      'name': "name",
      'tel': "tel",
    }),
  );
}
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var appBar = AppBar(
      title: Bar(),
    );

    var appBody = AppBody();

    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
        backgroundColor: Colors.grey[400],
      ),
      debugShowCheckedModeBanner: false,
    );
    return app;
  }
}

