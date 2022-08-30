import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({Key? key}) : super(key: key);

  @override
  State<JsonParsingSimple> createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Parsing Json"),
      ),
    );
  }

  Future getdata() async {
    // ignore: prefer_typing_uninitialized_variables
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.fetchData();
    data.then((value) {
      print(value[0]);
    });
    return data;
  }
  // ignore: dead_code
}

class Network {
  final String url;
  Network(this.url);

  Future fetchData() async {
    //here this method is of type future and async  so it waits
    print("$url");
    Response response = await get(Uri.parse("url"));
    if (response.statusCode == 200) {
      print(response.body[0]);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
