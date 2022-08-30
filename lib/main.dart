import 'package:flutter/material.dart';
import 'package:weatherapp/model/json_parsing.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  runApp(MaterialApp(
    home:JsonParsingSimple() ,
  ));
}
