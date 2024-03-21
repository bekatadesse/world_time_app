import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    //simulate network request for a username
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
    // print(data);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Loading'),
      ),
    );
  }
}
