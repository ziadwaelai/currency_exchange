import 'dart:convert';
import 'package:currency_exchange/components/components.dart';
import 'package:http/http.dart';

Future getData() async {
  var response = await get(Uri.parse(
      "http://api.exchangeratesapi.io/v1/latest?access_key=d3f4b7ddcd80ab5aec57a0e6c660077d&format=1"));
  var data = await jsonDecode(response.body);
  date = await data['date'];
  return data;
}
